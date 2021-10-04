import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_challenge/src/dashboard/todo_composer/todo_composer.dart';
import 'package:todo_challenge/src/todo/todo.dart';
import 'package:todo_challenge/src/todo/todo_list_store.dart';
import 'package:todo_challenge/src/widgets/app_checkbox.dart';
import 'package:todo_challenge/src/widgets/screen.dart';

import 'todo_list_section.dart';

/// An item in the filtered to-do list shown in [TodoListSection].
class TodoListSectionItem extends HookConsumerWidget {
  final Todo todo;

  const TodoListSectionItem({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isPressed = useState(false);

    final toggleTodo = useCallback((bool isCompleted) {
      ref.read(todoListStoreProvider.notifier).editTodo(
            withId: todo.id,
            editor: (todo) => todo.copyWith(isCompleted: isCompleted),
          );
    }, [todo, ref]);

    final viewTodo = useCallback(() {
      ref.read(todoComposerControllerProvider.notifier).viewTodo(todo);
    }, [todo, ref]);

    return GestureDetector(
      onTapDown: (_) {
        isPressed.value = true;
      },
      onTapUp: (_) {
        isPressed.value = false;
      },
      onTapCancel: ([_]) {
        isPressed.value = false;
      },
      onTap: viewTodo,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Screen.padding.left,
          vertical: 8,
        ),
        color: isPressed.value
            ? theme.textTheme.bodyText1?.color?.withOpacity(0.1)
            : Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                todo.content,
                style: TextStyle(
                  color: theme.textTheme.subtitle1?.color?.withOpacity(1),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  decoration:
                      todo.isCompleted ? TextDecoration.lineThrough : null,
                ),
                maxLines: 100,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 16),
            AppCheckbox(
              checked: todo.isCompleted,
              onChanged: toggleTodo,
            ),
          ],
        ),
      ),
    );
  }
}
