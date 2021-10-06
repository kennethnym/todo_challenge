import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_challenge/src/widgets/slide_animation.dart';

import 'editable_todo.dart';
import 'todo_composer_controller.dart';
import 'todo_composer_actions.dart';

export 'todo_composer_controller.dart';

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
    }, [ref, todoContentTextFieldController]);

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
    }, [
      todoComposerMode,
      todoContentTextFieldController,
      todoContentTextFieldFocusNode
    ]);

    useEffect(() {
      todoContentTextFieldController.addListener(todoContentTextFieldListener);
      return () {
        todoContentTextFieldController
            .removeListener(todoContentTextFieldListener);
      };
    }, [todoContentTextFieldController, todoContentTextFieldListener]);

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: SlideAnimation(
        visible: todoComposerMode is! TodoComposerModeHidden,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: theme.primaryColor,
          ),
          child: SafeArea(
            top: false,
            child: Column(
              children: [
                TextField(
                  readOnly: todoComposerMode is TodoComposerModeViewTodo,
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
                  color:
                      theme.primaryTextTheme.bodyText1?.color?.withOpacity(0.5),
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
        ),
      ),
    );
  }
}
