import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_challenge/src/providers/random_generator_provider.dart';
import 'package:todo_challenge/src/utils/random_utils.dart';

import 'todo.dart';

/// Defines a function that edits (modifies) the given to-do and returns
/// the edited version.
typedef TodoEditor = Todo Function(Todo);

/// A [StateNotifierProvider] that provides the instance of [TodoListStore].
final todoListStoreProvider = StateNotifierProvider<TodoListStore, List<Todo>>(
    (ref) => TodoListStore(ref.read));

/// A [StateNotifier] that manages lists of [Todo]s, independent of data source.
class TodoListStore extends StateNotifier<List<Todo>> {
  /// A set of IDs of existing to-dos.
  /// This is used to check whether the newly-generated ID for the new to-do
  /// conflicts with existing to-dos.
  final _existingTodoIds = <int>{};

  final Reader _read;

  TodoListStore(this._read) : super([]);

  /// Imports [todos] to this store. All existing todos will be overwritten.
  void importTodos(Iterable<Todo> todos) {
    final importedTodos = <Todo>[];
    for (final todo in todos) {
      importedTodos.add(todo);
      _existingTodoIds.add(todo.id);
    }
    state = importedTodos;
    print('importedTodos $importedTodos');
  }

  /// Creates a new [Todo] with [content] that will be the content of the [Todo].
  /// The created [Todo] will be added to the current list of [Todo]s.
  void addTodo({required String content}) {
    if (content.isNotEmpty) {
      state = [
        ...state,
        Todo(
          id: _generateTodoId(),
          content: content,
          isCompleted: false,
        ),
      ];
    }
  }

  /// Edits the [Todo] with the given id [withId] using [editor].
  /// [editor] should return the edited version of the [Todo] passed
  /// to [editor].
  void editTodo({required int withId, required TodoEditor editor}) {
    state =
        state.map((todo) => todo.id == withId ? editor(todo) : todo).toList();
  }

  /// Generates a new 32-bit ID for a [Todo].
  int _generateTodoId() {
    late int id;
    do {
      id = _read(randomGeneratorProvider).nextBigInt(bit: 32);
    } while (_existingTodoIds.contains(id));
    _existingTodoIds.add(id);
    return id;
  }
}
