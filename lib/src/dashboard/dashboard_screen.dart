import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_challenge/src/auth/auth_service.dart';
import 'package:todo_challenge/src/dashboard/providers/filtered_todo_list_provider.dart';
import 'package:todo_challenge/src/dashboard/todo_composer/todo_composer.dart';
import 'package:todo_challenge/src/dashboard/todo_list_section.dart';
import 'package:todo_challenge/src/routes.dart';
import 'package:todo_challenge/src/todo/todo_list_synchronizer.dart';
import 'package:todo_challenge/src/todo/widgets/todo_sync_failed_snackbar.dart';
import 'package:todo_challenge/src/widgets/screen.dart';

import 'user_profile_card_overlay/user_profile_card_overlay.dart';
import 'dynamic_header.dart';
import 'add_todo_button.dart';

class DashboardScreen extends HookConsumerWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    final handleBackButtonPress = useCallback(() async {
      if (ref.read(userProfileCardOverlayControllerProvider)
          is UserProfileCardVisible) {
        ref
            .read(userProfileCardOverlayControllerProvider.notifier)
            .closeProfile();
        return false;
      } else if (ref.read(todoComposerControllerProvider)
          is! TodoComposerModeHidden) {
        ref.read(todoComposerControllerProvider.notifier).closeTodoComposer();
        return false;
      }
      return true;
    }, [ref]);

    final syncStatusListener = useCallback((TodoSyncStatus status) {
      switch (status) {
        case TodoSyncStatus.failed:
          ScaffoldMessenger.of(context).showSnackBar(
            todoSyncFailedSnackBar(),
          );
          break;

        default:
          break;
      }
    }, [context]);

    final authStatusListener = useCallback((AuthStatus authStatus) {
      if (authStatus is AuthStatusNotLoggedIn) {
        Navigator.of(context).popAndPushNamed(AppRoute.landing);
      }
    }, [context]);

    ref
      ..listen(authServiceProvider, authStatusListener)
      ..listen(todoListSynchronizerProvider, syncStatusListener);

    return WillPopScope(
      onWillPop: handleBackButtonPress,
      child: Screen(
        child: RefreshIndicator(
          strokeWidth: 4.0,
          onRefresh:
              ref.read(todoListSynchronizerProvider.notifier).refreshList,
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: mediaQuery.size.height * 0.2,
                    backgroundColor: theme.backgroundColor,
                    shadowColor:
                        theme.textTheme.bodyText1?.color?.withOpacity(0.1),
                    primary: true,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      title: const DynamicHeader(),
                      titlePadding: EdgeInsetsDirectional.only(
                        start: Screen.padding.left,
                        end: Screen.padding.right,
                        bottom: 8,
                      ),
                    ),
                  ),
                  const TodoListSection(
                    title: 'UPCOMING TASK',
                    filter: TodoListVisibilityFilter.incomplete,
                  ),
                  SliverToBoxAdapter(
                    child: Divider(
                      color: theme.textTheme.bodyText1?.color?.withOpacity(0.5),
                    ),
                  ),
                  const SliverPadding(
                    // add bottom padding to the completed to-do list
                    // to account for the floating add button
                    padding: EdgeInsets.only(bottom: 128),
                    sliver: TodoListSection(
                      title: 'COMPLETED',
                      filter: TodoListVisibilityFilter.completed,
                      showItemCount: true,
                    ),
                  ),
                ],
              ),
              const AddTodoButton(),
              const TodoComposer(),
              const UserProfileCardOverlay(),
            ],
          ),
        ),
      ),
    );
  }
}
