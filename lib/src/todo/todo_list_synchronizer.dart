import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_challenge/src/auth/auth_service.dart';

import 'todo_list_store.dart';
import 'todo.dart';

/// Provides the instance of [TodoListSynchronizer].
final todoListSynchronizerProvider =
    StateNotifierProvider<TodoListSynchronizer, TodoSyncStatus>(
        (ref) => TodoListSynchronizer(ref.read));

/// Possible sync statuses of [TodoListSynchronizer].
enum TodoSyncStatus {
  /// [TodoListSynchronizer] is initializing
  initializing,

  /// [TodoListSynchronizer] is syncing local changes
  syncing,

  /// [TodoListSynchronizer] has successfully synced local changes to server.
  synced,

  /// [TodoListSynchronizer] has stopped syncing.
  stopped,

  /// [TodoListSynchronizer] failed to perform synchronization.
  failed,
}

/// Specifies how long [TodoListSynchronizer] should wait after the local list is
/// modified before the changes are committed to the server.
/// If new local changes are made within the timeout, the timeout is reset.
const _syncTimeout = Duration(seconds: 2);

/// Synchronizes changes from local to-do list to server.
class TodoListSynchronizer extends StateNotifier<TodoSyncStatus> {
  /// The list of [Todo]s that the server stores.
  final _serverTodoDocuments = <int, _TodoDocument>{};

  final Reader _read;

  /// A reference to the firebase collection of user to-dos.
  final CollectionReference<Map<String, dynamic>> _todoCollection =
      FirebaseFirestore.instance.collection('todos');

  Timer? _syncTimer;

  late final VoidCallback _cancelAuthStatusListener;

  User? _loggedInUser;

  TodoListSynchronizer(this._read) : super(TodoSyncStatus.initializing) {
    _listenToAuthStatusChanges();
  }

  /// Pulls to-do lists saved on the server to local.
  Future<void> refreshList() => _fetchServerTodoList();

  @override
  void dispose() {
    _stopSyncing();
    _cancelAuthStatusListener();
    super.dispose();
  }

  void _listenToAuthStatusChanges() {
    _cancelAuthStatusListener =
        _read(authServiceProvider.notifier).addListener(_authStatusListener);
  }

  void _authStatusListener(AuthStatus status) {
    status.maybeWhen(
      loggedIn: (user) {
        _loggedInUser = user;
        _startSyncing();
      },
      notLoggedIn: () {
        _loggedInUser = null;
        _stopSyncing();
        _serverTodoDocuments.clear();
        state = TodoSyncStatus.stopped;
      },
      orElse: () {
        _loggedInUser = null;
      },
    );
  }

  void _startSyncing() async {
    await _fetchServerTodoList();
    _subscribeToLocalListChanges();
    state = TodoSyncStatus.synced;
  }

  Future<void> _fetchServerTodoList() async {
    // don't allow refreshing when syncing or when sync is on timeout
    // to avoid losing changes.
    if (state == TodoSyncStatus.syncing || _syncTimer?.isActive == true) return;

    final loggedInUser = _loggedInUser;
    if (loggedInUser == null) return;

    if (state == TodoSyncStatus.synced) {
      state = TodoSyncStatus.syncing;
    }

    try {
      final query = await _todoCollection
          .where('created_by', isEqualTo: loggedInUser.uid)
          .get();

      for (final doc in query.docs) {
        final todo = Todo.fromJson(doc.data());
        _serverTodoDocuments[todo.id] = _TodoDocument(
          docRef: doc.reference,
          todo: todo,
        );
      }

      _read(todoListStoreProvider.notifier)
          .importTodos(_serverTodoDocuments.values.map((doc) => doc.todo));

      if (state == TodoSyncStatus.syncing) {
        state = TodoSyncStatus.synced;
      }
    } catch (ex) {
      state = TodoSyncStatus.failed;
    }
  }

  void _subscribeToLocalListChanges() {
    _read(todoListStoreProvider.notifier).addListener(
      _syncListToServer,
      fireImmediately: false,
    );
  }

  void _syncListToServer(List<Todo> newList) {
    _syncTimer?.cancel();
    _syncTimer = Timer(_syncTimeout, () async {
      final authStatus = _read(authServiceProvider);

      if (authStatus is! AuthStatusLoggedIn) {
        return;
      }

      final user = authStatus.loggedInUser;

      state = TodoSyncStatus.syncing;

      final batchOperations = FirebaseFirestore.instance.batch();

      /// A temporary that that stores an updated map of to-dos after
      /// local changes are applied. If the batch operations are successful,
      /// the changes are saved.
      final updatedTodos = <int, _TodoDocument>{};

      for (final localTodo in newList) {
        final todoDoc = _serverTodoDocuments[localTodo.id];
        if (todoDoc != null && todoDoc.todo != localTodo) {
          // the to-do is updated locally
          updatedTodos[localTodo.id] = _TodoDocument(
            todo: localTodo,
            docRef: todoDoc.docRef,
          );
          batchOperations.update(todoDoc.docRef, localTodo.diff(todoDoc.todo));
        } else if (todoDoc == null) {
          final newDoc = _todoCollection.doc();
          // a new to-do is created locally
          updatedTodos[localTodo.id] =
              _TodoDocument(docRef: newDoc, todo: localTodo);
          batchOperations.set(newDoc, {
            ...localTodo.toJson(),
            'created_by': user.uid,
          });
        }
      }

      try {
        await batchOperations.commit();
        _serverTodoDocuments.addAll(updatedTodos);
        state = TodoSyncStatus.synced;
      } catch (ex) {
        state = TodoSyncStatus.failed;
      }
    });
  }

  void _stopSyncing() {
    _syncTimer?.cancel();
  }
}

/// Represents a document in the todos firestore collection
class _TodoDocument {
  /// The reference to the underlying firestore document.
  final DocumentReference docRef;

  /// The actual [Todo] that this document stores.
  final Todo todo;

  const _TodoDocument({
    required this.docRef,
    required this.todo,
  });

  /// The auto-generated ID of this document.
  String get id => docRef.id;
}
