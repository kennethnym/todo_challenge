import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_challenge/src/todo/todo.dart';
import 'package:todo_challenge/src/todo/todo_list_store.dart';

/// A collection of filters that can be applied to the to-do list
/// to show more specific to-dos.
enum TodoListVisibilityFilter {
  /// A filter that shows only completed to-dos.
  completed,

  /// A filter that shows only incomplete to-dos.
  incomplete,
}

typedef _TodoFilterFunction = bool Function(Todo);

final _filterMaps = <TodoListVisibilityFilter, _TodoFilterFunction>{
  TodoListVisibilityFilter.completed: (todo) => todo.isCompleted,
  TodoListVisibilityFilter.incomplete: (todo) => !todo.isCompleted,
};

/// A [Provider] that provides the current to-do list filtered with the given filter.
/// If no filter is provided, the entire list is returned.
final filteredTodoListProvider =
    Provider.family<List<Todo>, TodoListVisibilityFilter?>((ref, filter) {
  final todoListStore = ref.watch(todoListStoreProvider);
  final passesFilter = _filterMaps[filter];
  if (passesFilter == null) return todoListStore;
  return todoListStore.where(passesFilter).toList();
});
