import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_challenge/src/dashboard/providers/filtered_todo_list_provider.dart';

import 'dashboard_screen.dart';
import 'todo_list_section_item.dart';

/// A section on [DashboardScreen] that shows the current to-do list
/// with the given filter applied.
class TodoListSection extends HookConsumerWidget {
  final String title;
  final TodoListVisibilityFilter filter;
  final bool showItemCount;

  const TodoListSection({
    Key? key,
    required this.title,
    required this.filter,
    this.showItemCount = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredTodoList = ref.watch(filteredTodoListProvider(filter));
    final isCollapsed = useState(false);
    final itemCount = filteredTodoList.length;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, i) => i == 0
            ? _SectionTitle(
                title,
                itemCount: showItemCount ? itemCount : null,
                collapsed: isCollapsed.value,
                onTap: () {
                  isCollapsed.value = !isCollapsed.value;
                },
              )
            : TodoListSectionItem(todo: filteredTodoList[i - 1]),
        // child count is number of items in the filtered to-do list
        // plus 1 for the section header.
        childCount: isCollapsed.value ? 1 : itemCount + 1,
      ),
    );
  }
}

/// Draws the title for [TodoListSection]
class _SectionTitle extends HookWidget {
  final String title;
  final bool collapsed;
  final int? itemCount;
  final VoidCallback onTap;

  const _SectionTitle(
    this.title, {
    Key? key,
    required this.collapsed,
    required this.onTap,
    this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isPressed = useState(false);

    return GestureDetector(
      onTapDown: (_) {
        isPressed.value = true;
      },
      onTapUp: (_) {
        isPressed.value = false;
      },
      onTapCancel: () {
        isPressed.value = false;
      },
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(
          left: DashboardScreen.padding.left,
          right: DashboardScreen.padding.right,
          top: 8,
          bottom: 8,
        ),
        color: isPressed.value
            ? theme.textTheme.bodyText1?.color?.withOpacity(0.1)
            : Colors.transparent,
        child: Row(
          children: [
            Expanded(
              child: Text(
                '$title ${itemCount != null ? '($itemCount)' : ''}',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Icon(
              collapsed ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
              color: theme.textTheme.bodyText1?.color,
            ),
          ],
        ),
      ),
    );
  }
}
