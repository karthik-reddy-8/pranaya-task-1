import 'package:floor/floor.dart';

@entity
class Todo {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String title;
  final String workType;
  final bool completed;

  Todo({
    this.id,
    required this.title,
    required this.workType,
    required this.completed,
  });
}
