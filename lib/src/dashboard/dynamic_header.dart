import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_challenge/src/dashboard/dashboard_screen.dart';
import 'package:todo_challenge/src/dashboard/providers/filtered_todo_list_provider.dart';
import 'package:todo_challenge/src/todo/todo_list_synchronizer.dart';

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

    return Row(
      children: [
        Expanded(
          child: Text(
            '$incompleteTodoCount task${incompleteTodoCount > 1 ? 's' : ''} due.',
            style: theme.textTheme.headline1,
          ),
        ),
        const _SyncStatusIndicator(),
      ],
    );
  }
}

class _SyncStatusIndicator extends HookConsumerWidget {
  const _SyncStatusIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoListSyncStatus = ref.watch(todoListSynchronizerProvider);

    return Opacity(
      opacity: todoListSyncStatus == TodoSyncState.synced ? 0 : 1,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: DashboardScreen.padding.right,
        ),
        child: const SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
