import 'package:hooks_riverpod/hooks_riverpod.dart';

final todoComposerControllerProvider =
    StateNotifierProvider<TodoComposerController, bool>(
        (_) => TodoComposerController());

class TodoComposerController extends StateNotifier<bool> {
  TodoComposerController() : super(false);

  /// Shows [TodoComposer] on [DashboardScreen].
  void showTodoComposer() {
    state = true;
  }

  /// Closes [TodoComposer].
  void closeTodoComposer() {
    state = false;
  }
}
