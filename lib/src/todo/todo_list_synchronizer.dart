import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'todo_list_store.dart';
import 'todo.dart';

/// Provides the instance of [TodoListSynchronizer].
final todoListSynchronizerProvider =
    StateNotifierProvider((ref) => TodoListSynchronizer(ref.read));

/// Possible sync statuses of [TodoListSynchronizer].
enum TodoSyncState {
  /// [TodoListSynchronizer] is initializing
  initializing,

  /// [TodoListSynchronizer] is syncing local changes
  syncing,

  /// [TodoListSynchronizer] has successfully synced local changes to server.
  synced,
}

/// Specifies how long [TodoListSynchronizer] should wait after the local list is
/// modified before the changes are committed to the server.
/// If new local changes are made within the timeout, the timeout is reset.
const _syncTimeout = Duration(seconds: 2);

/// Synchronizes changes from local to-do list to server.
class TodoListSynchronizer extends StateNotifier<TodoSyncState> {
  /// The list of [Todo]s that the server stores.
  final _serverTodoDocuments = <int, _TodoDocument>{};

  final Reader _read;

  /// A reference to the firebase collection of user to-dos.
  final CollectionReference<Map<String, dynamic>> _todoCollection =
      FirebaseFirestore.instance.collection('todos');

  Timer? _syncTimer;

  TodoListSynchronizer(this._read) : super(TodoSyncState.initializing) {
    _initialize();
  }

  void _initialize() async {
    await _fetchServerTodoList();
    _subscribeToLocalListChanges();
    state = TodoSyncState.synced;
  }

  Future<void> _fetchServerTodoList() async {
    final query = await _todoCollection.get();
    for (final doc in query.docs) {
      final todo = Todo.fromJson(doc.data());
      _serverTodoDocuments[todo.id] = _TodoDocument(
        docRef: doc.reference,
        todo: todo,
      );
    }
    _read(todoListStoreProvider.notifier)
        .importTodos(_serverTodoDocuments.values.map((doc) => doc.todo));
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
      state = TodoSyncState.syncing;

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
          batchOperations.set(newDoc, localTodo.toJson());
        }
      }

      await batchOperations.commit();
      _serverTodoDocuments.addAll(updatedTodos);

      state = TodoSyncState.synced;
    });
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
