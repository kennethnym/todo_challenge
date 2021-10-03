import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_challenge/src/todo/todo_list_store.dart';
import 'package:todo_challenge/src/widgets/transparent_button.dart';

import 'todo_composer_controller.dart';
import 'todo_composer_animator.dart';

/// A widget that allows users to composes a new to-do.
class TodoComposer extends HookConsumerWidget {
  const TodoComposer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final todoContentTextFieldController = useTextEditingController();

    final closeComposer = useCallback(() {
      ref.read(todoComposerControllerProvider.notifier).closeTodoComposer();
    }, [ref]);

    final addTodo = useCallback(() {
      ref
          .read(todoListStoreProvider.notifier)
          .addTodo(content: todoContentTextFieldController.text);
    }, [ref, todoContentTextFieldController]);

    return TodoComposerAnimator(
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            TextField(
              controller: todoContentTextFieldController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16),
                border: InputBorder.none,
                hintText: 'Type in your task here...',
                hintStyle: TextStyle(
                  color: theme.primaryTextTheme.bodyText1?.color,
                ),
              ),
              cursorColor: theme.primaryTextTheme.bodyText1?.color,
              style: theme.primaryTextTheme.bodyText1,
            ),
            Divider(
              color: theme.primaryTextTheme.bodyText1?.color?.withOpacity(0.5),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
