import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_challenge/src/todo/todo.dart';

import 'todo_composer.dart';
import 'todo_composer_mode.dart';

export 'todo_composer_mode.dart';

final todoComposerControllerProvider =
    StateNotifierProvider<TodoComposerController, TodoComposerMode>(
        (_) => TodoComposerController());

/// A [StateNotifier] that controls the view mode of [TodoComposer]
class TodoComposerController extends StateNotifier<TodoComposerMode> {
  TodoComposerController() : super(const TodoComposerMode.hidden());

  /// Shows [TodoComposer] on [DashboardScreen].
  void showTodoComposer() {
    state = const TodoComposerMode.addTodo();
  }

  /// Closes [TodoComposer].
  void closeTodoComposer() {
    state = const TodoComposerMode.hidden();
  }

  void viewTodo(Todo todo) {
    state = TodoComposerMode.viewTodo(todo);
  }

  /// Tells [TodoComposer] to allow user to edit [todo].
  void editTodo(Todo todo) {
    state = TodoComposerMode.editTodo(todo);
  }
}
