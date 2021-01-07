import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'note.g.dart';

/// generate part files
/// flutter packages pub run build_runner build --delete-conflicting-outputs
@HiveType(typeId: 0)
class Note {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String body;

  @HiveField(3)
  final bool completed;

  @HiveField(4)
  final int color;

  @HiveField(5)
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
        createdAt: this.createdAt,
      );
}
