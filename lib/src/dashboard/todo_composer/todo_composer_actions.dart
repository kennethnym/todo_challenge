import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_challenge/src/todo/todo.dart';
import 'package:todo_challenge/src/todo/todo_list_store.dart';
import 'package:todo_challenge/src/widgets/transparent_button.dart';

import 'editable_todo.dart';
import 'todo_composer.dart';
import 'todo_composer_controller.dart';

/// A list of actions available for [TodoComposer], shown as a row
/// of buttons at the bottom of the composer.
class TodoComposerActions extends HookConsumerWidget {
  const TodoComposerActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoComposerMode = ref.watch(todoComposerControllerProvider);
    final theme = Theme.of(context);

    final closeComposer = useCallback(() {
      ref
        ..read(editableTodoProvider).reset()
        ..read(todoComposerControllerProvider.notifier).closeTodoComposer();
    }, [ref]);

    final addTodo = useCallback(() {
      final editableTodo = ref.read(editableTodoProvider);
      ref
        ..read(todoListStoreProvider.notifier).addTodo(
          content: editableTodo.content,
        )
        ..read(todoComposerControllerProvider.notifier).closeTodoComposer();
      editableTodo.reset();
    }, [ref]);

    final editTodo = useCallback((Todo todo) {
      ref.read(todoComposerControllerProvider.notifier).editTodo(todo);
    }, [ref]);

    final cancelEdit = useCallback((Todo originalTodo) {
      ref.read(todoComposerControllerProvider.notifier).viewTodo(originalTodo);
    }, [ref]);

    final saveEditedTodo = useCallback((Todo originalTodo) {
      final editableTodo = ref.read(editableTodoProvider);
      final newTodo = originalTodo.copyWith(
        content: editableTodo.content,
      );

      ref
        ..read(todoListStoreProvider.notifier).editTodo(
          withId: originalTodo.id,
          editor: (_) => newTodo,
        )
        ..read(todoComposerControllerProvider.notifier).viewTodo(newTodo);
    }, [ref]);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: todoComposerMode.when(
        hidden: () => const [],
        addTodo: () => [
          TransparentButton(
            icon: Icons.close,
            label: 'CANCEL',
            textStyle: theme.primaryTextTheme.button,
            onTap: closeComposer,
          ),
          TransparentButton(
            icon: Icons.check,
            label: 'ADD',
            textStyle: theme.primaryTextTheme.button,
            onTap: addTodo,
          ),
        ],
        viewTodo: (todo) => [
          TransparentButton(
            icon: Icons.close,
            label: 'CLOSE',
            textStyle: theme.primaryTextTheme.button,
            onTap: closeComposer,
          ),
          TransparentButton(
            icon: Icons.edit,
            label: 'EDIT',
            textStyle: theme.primaryTextTheme.button,
            onTap: () {
              editTodo(todo);
            },
          ),
        ],
        editTodo: (todo) => [
          TransparentButton(
            icon: Icons.close,
            label: 'CANCEL',
            textStyle: theme.primaryTextTheme.button,
            onTap: () {
              cancelEdit(todo);
            },
          ),
          TransparentButton(
            icon: Icons.check,
            label: 'SAVE',
            textStyle: theme.primaryTextTheme.button,
            onTap: () {
              saveEditedTodo(todo);
            },
          ),
        ],
      ),
    );
  }
}
