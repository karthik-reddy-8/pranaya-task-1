import 'package:floor/floor.dart';

@entity
class Todo {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String title;
  final String worktype;
  final bool completed;

  Todo(this.id, this.title, this.worktype, this.completed);
}
