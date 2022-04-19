import 'package:floor/floor.dart';

import 'model_class.dart';

@dao
abstract class TodoDAO {
  @insert
  Future<List<int>> insertTodo(List<Todo> todo);

  @Query('SELECT * FROM Todo')
  Future<List<Todo>> retriveTodos();

  @Query('SELECT * FROM Todo WHERE worktype = :type')
  Future<List<Todo>> retriveTodosByWorkType(String type);

  @Query('SELECT * FROM Todo WHERE worktype = :type, completed = :completed')
  Future<List<Todo>> getTodoByStatus(String type, bool completed);
}
