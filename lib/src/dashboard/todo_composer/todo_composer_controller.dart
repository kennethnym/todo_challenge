import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_challenge/src/auth/auth_service.dart';
import 'package:todo_challenge/src/todo/todo.dart';

import 'todo_composer.dart';
import 'todo_composer_mode.dart';

export 'todo_composer_mode.dart';

/// Provides the instance of [TodoComposerController] to be used
/// to control the behavior of [TodoComposer].
final todoComposerControllerProvider =
    StateNotifierProvider<TodoComposerController, TodoComposerMode>(
        (ref) => TodoComposerController(ref.read));

/// A [StateNotifier] that controls the view mode of [TodoComposer]
class TodoComposerController extends StateNotifier<TodoComposerMode> {
  final Reader _read;

  late final VoidCallback _removeAuthStatusListener;

  TodoComposerController(this._read) : super(const TodoComposerMode.hidden()) {
    _removeAuthStatusListener =
        _read(authServiceProvider.notifier).addListener(_authStatusListener);
  }

  /// Shows [TodoComposer] on [DashboardScreen].
  void showTodoComposer() {
    state = const TodoComposerMode.addTodo();
  }

  /// Closes [TodoComposer].
  void closeTodoComposer() {
    state = const TodoComposerMode.hidden();
  }

  /// Tells [TodoComposer] to show the content of [todo].
  void viewTodo(Todo todo) {
    state = TodoComposerMode.viewTodo(todo);
  }

  /// Tells [TodoComposer] to allow user to edit [todo].
  void editTodo(Todo todo) {
    state = TodoComposerMode.editTodo(todo);
  }

  @override
  void dispose() {
    _removeAuthStatusListener();
    super.dispose();
  }

  void _authStatusListener(AuthStatus authStatus) {
    if (authStatus is AuthStatusNotLoggedIn &&
        state is! TodoComposerModeHidden) {
      closeTodoComposer();
    }
  }
}
