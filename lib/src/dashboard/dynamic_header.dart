import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_challenge/src/dashboard/filtered_todo_list_provider.dart';

/// A header shown on the dashboard that shows user how many tasks are due soon.
class DynamicHeader extends HookConsumerWidget {
  const DynamicHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final incompleteTodos = ref
        .watch(filteredTodoListProvider(TodoListVisibilityFilter.incomplete));

    if (incompleteTodos.isEmpty) {
      return Text('0 task due 🎉', style: theme.textTheme.headline1);
    }

    final incompleteTodoCount = incompleteTodos.length;

    return Text(
      '$incompleteTodoCount task${incompleteTodoCount > 1 ? 's' : ''} due.',
      style: theme.textTheme.headline1,
    );
  }
}
