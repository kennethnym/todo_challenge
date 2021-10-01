import 'package:flutter/material.dart';
import 'package:todo_challenge/src/dashboard/filtered_todo_list_provider.dart';
import 'package:todo_challenge/src/dashboard/todo_list_section.dart';

import 'dynamic_header.dart';
import 'add_todo_button.dart';

class DashboardScreen extends StatelessWidget {
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
                    bottom: 16,
                  ),
                ),
              ),
              const TodoListSection(
                title: 'UPCOMING TASK',
                filter: TodoListVisibilityFilter.incomplete,
              ),
              const TodoListSection(
                title: 'COMPLETED',
                filter: TodoListVisibilityFilter.completed,
                showItemCount: true,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: padding.left,
                vertical: mediaQuery.padding.bottom + 24,
              ),
              child: const AddTodoButton(),
            ),
          ),
        ],
      ),
    );
  }
}
