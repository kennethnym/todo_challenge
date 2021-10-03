import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'todo_composer.dart';

/// Provides the current [EditableTodo] being edited.
final editableTodoProvider = Provider((_) => EditableTodo());

/// An editable to-do that is used by [TodoComposer] to keep track
/// of the current values of the to-do being edited.
class EditableTodo {
  String content;

  EditableTodo({this.content = ''});

  /// Resets all the stored values to their default values.
  void reset() {
    content = '';
  }
}
