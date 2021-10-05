import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_challenge/src/dashboard/providers/filtered_todo_list_provider.dart';
import 'package:todo_challenge/src/todo/todo_list_synchronizer.dart';
import 'package:todo_challenge/src/user/current_user_avatar.dart';
import 'package:todo_challenge/src/user/user_avatar.dart';

/// A header shown on the dashboard that shows user how many tasks are due soon.
class DynamicHeader extends HookConsumerWidget {
  const DynamicHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final todoListSyncStatus = ref.watch(todoListSynchronizerProvider);
    final incompleteTodos = ref
        .watch(filteredTodoListProvider(TodoListVisibilityFilter.incomplete));

    final incompleteTodoCount = incompleteTodos.length;

    late final String statusText;
    if (todoListSyncStatus == TodoSyncState.initializing) {
      statusText = 'Loading...';
    } else if (incompleteTodos.isEmpty) {
      statusText = '0 task due 🎉';
    } else {
      statusText =
          '$incompleteTodoCount task${incompleteTodoCount > 1 ? 's' : ''} due.';
    }

    return Row(
      children: [
        Expanded(
          child: Text(statusText, style: theme.textTheme.headline1),
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

    switch (todoListSyncStatus) {
      case TodoSyncState.synced:
        return const CurrentUserAvatar();

      case TodoSyncState.syncing:
      case TodoSyncState.initializing:
        return const SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(),
        );

      default:
        return Container();
    }
  }
}
