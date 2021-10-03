import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_challenge/src/dashboard/todo_composer/editable_todo.dart';

import 'todo_composer_controller.dart';
import 'todo_composer_actions.dart';
import 'todo_composer_animator.dart';

/// A widget that allows users to composes a new to-do.
class TodoComposer extends HookConsumerWidget {
  const TodoComposer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoComposerMode = ref.watch(todoComposerControllerProvider);
    final theme = Theme.of(context);
    final todoContentTextFieldController = useTextEditingController();
    final todoContentTextFieldFocusNode = useFocusNode();

    final todoContentTextFieldListener = useCallback(() {
      ref.read(editableTodoProvider).content =
          todoContentTextFieldController.text;
    }, [ref]);

    useEffect(() {
      todoComposerMode.when(
        addTodo: () {
          todoContentTextFieldFocusNode.requestFocus();
        },
        viewTodo: (selectedTodo) {
          todoContentTextFieldFocusNode.unfocus();
          todoContentTextFieldController.text = selectedTodo.content;
        },
        editTodo: (_) {
          todoContentTextFieldFocusNode.requestFocus();
        },
        hidden: () {
          ref.read(editableTodoProvider).reset();
          todoContentTextFieldController.clear();
          todoContentTextFieldFocusNode.unfocus();
        },
      );
    }, [todoComposerMode]);

    useEffect(() {
      todoContentTextFieldController.addListener(todoContentTextFieldListener);
      return () {
        todoContentTextFieldController
            .removeListener(todoContentTextFieldListener);
      };
    }, [todoContentTextFieldController, todoContentTextFieldListener]);

    return TodoComposerAnimator(
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            TextField(
              readOnly: todoComposerMode is ViewTodo,
              controller: todoContentTextFieldController,
              focusNode: todoContentTextFieldFocusNode,
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
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: TodoComposerActions(),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
