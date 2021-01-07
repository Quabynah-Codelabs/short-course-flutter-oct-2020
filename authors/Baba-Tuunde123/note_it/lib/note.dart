import 'package:meta/meta.dart';

class Note {
  final String id;
  final String title;
  final String body;
  final bool completed;
  final int color;
  final String createdAt;

  /// parameterized constructor
  Note({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.color,
    @required this.createdAt,
    this.completed = false,
  });

  /// named constructor
  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json['id'],
        title: json['title'],
        body: json['body'],
        color: json['color'],
        completed: json['completed'],
        createdAt: json['createdAt'],
      );

  /// used to create a copy of an existing note
  Note copyWith({
    String title,
    String body,
    bool completed,
    int color,
  }) =>
      Note(
        id: this.id,
        title: title ??= this.title,
        body: body ??= this.body,
        color: color ??= this.color,
        completed: completed ??= this.completed,
      );
}
