import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

/// Represents a to-do item.
@JsonSerializable()
class Todo {
  /// A unique ID that identifies this [Todo].
  final int id;

  /// The content of this [Todo].
  final String content;

  /// Whether this [Todo] is completed or not.
  @JsonKey(name: 'is_completed')
  final bool isCompleted;

  const Todo({
    required this.id,
    required this.content,
    required this.isCompleted,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);

  Todo copyWith({String? content, bool? isCompleted}) => Todo(
        id: id,
        content: content ?? this.content,
        isCompleted: isCompleted ?? this.isCompleted,
      );

  /// Generate a JSON map that contains values that are different than
  /// the fields in [other].
  ///
  /// This [todo] will be treated as the source of truth,
  /// and the produced map will contain values of this [Todo] that are different
  /// than [other].
  ///
  /// Note that the keys for the fields are the same as the ones used
  /// for de/serializing [Todo] from/to json.
  Map<String, dynamic> diff(Todo other) => {
        if (isCompleted != other.isCompleted) 'is_completed': isCompleted,
        if (content != other.content) 'content': content,
        if (id != other.id) 'id': id,
      };
}
