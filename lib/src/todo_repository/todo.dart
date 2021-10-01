/// Represents a to-do item.
class Todo {
  /// A unique ID that identifies this [Todo].
  final int id;

  /// The content of this [Todo].
  final String content;

  /// Whether this [Todo] is completed or not.
  final bool isCompleted;

  const Todo({
    required this.id,
    required this.content,
    required this.isCompleted,
  });

  Todo copyWith({String? content, bool? isCompleted}) => Todo(
        id: id,
        content: content ?? this.content,
        isCompleted: isCompleted ?? this.isCompleted,
      );
}
