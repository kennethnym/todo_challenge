import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_challenge/src/dashboard/providers/filtered_todo_list_provider.dart';
import 'package:todo_challenge/src/dashboard/todo_list_section.dart';

import 'todo_composer/todo_composer.dart';
import 'dynamic_header.dart';
import 'add_todo_button.dart';

class DashboardScreen extends HookWidget {
  /// The padding that applies to the dashboard.
  static const padding = EdgeInsets.only(
    left: 16,
    right: 16,
    top: 64,
  );

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final addTodoButtonKeyRef = useRef(GlobalKey());

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: mediaQuery.size.height * 0.2,
                backgroundColor: theme.backgroundColor,
                shadowColor: theme.textTheme.bodyText1?.color?.withOpacity(0.1),
                primary: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: const DynamicHeader(),
                  titlePadding: EdgeInsetsDirectional.only(
                    start: padding.left,
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: DashboardScreen.padding.left,
                vertical: MediaQuery.of(context).padding.bottom + 24,
              ),
              child: AddTodoButton(
                key: addTodoButtonKeyRef.value,
              ),
            ),
          ),
          const TodoComposer(),
        ],
      ),
    );
  }
}
