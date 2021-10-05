import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_challenge/src/auth/auth_service.dart';
import 'package:todo_challenge/src/todo/todo_list_synchronizer.dart';
import 'package:todo_challenge/src/user/current_user_avatar.dart';

import 'user_profile_card_overlay/user_profile_card_overlay.dart';
import 'providers/filtered_todo_list_provider.dart';

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

    final showUserProfileCardOverlay = useCallback(() {
      final authStatus = ref.read(authServiceProvider);
      if (authStatus is AuthStatusLoggedIn) {
        ref
            .read(userProfileCardControllerOverlayProvider.notifier)
            .showProfile(ofUser: authStatus.loggedInUser);
      }
    }, [ref]);

    switch (todoListSyncStatus) {
      case TodoSyncState.synced:
        return CurrentUserAvatar(
          onTap: showUserProfileCardOverlay,
        );

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
