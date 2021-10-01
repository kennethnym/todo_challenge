import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTodoButton extends HookConsumerWidget {
  const AddTodoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Container(
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
    );
  }
}
