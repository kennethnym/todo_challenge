import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_challenge/src/todo/todo.dart';

import 'todo_composer.dart';

part 'todo_composer_mode.freezed.dart';

@freezed
class TodoComposerMode with _$TodoComposerMode {
  /// In this mode, [TodoComposer] is hidden.
  const factory TodoComposerMode.hidden() = Hidden;

  /// In this mode, [TodoComposer] is allowing user to add a new to-do.
  const factory TodoComposerMode.addTodo() = AddTodo;

  /// In this mode, [TodoComposer] is showing the to-do user selected.
  const factory TodoComposerMode.viewTodo(Todo selectedTodo) = ViewTodo;

  /// In this mode, [TodoComposer] is editing the to-do user selected.
  const factory TodoComposerMode.editTodo(Todo todo) = EditTodo;
}
