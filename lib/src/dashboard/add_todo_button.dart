import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_challenge/src/dashboard/todo_composer/todo_composer_controller.dart';

class AddTodoButton extends HookConsumerWidget {
  const AddTodoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final showTodoComposer = useCallback(() {
      ref.read(todoComposerControllerProvider.notifier).showTodoComposer();
    }, [ref]);

    return GestureDetector(
      onTap: showTodoComposer,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: theme.primaryColor,
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: const Offset(0, 8),
              blurRadius: 24,
              color: theme.primaryColor.withOpacity(0.32),
            ),
          ],
        ),
        child: Text('+ ADD', style: theme.primaryTextTheme.button),
      ),
    );
  }
}
