import 'package:floor/floor.dart';

import 'model_class.dart';

@dao
abstract class TodoDAO {
  @insert
  Future<List<int>> insertTodo(List<Todo> todo);

  @insert
  Future<void> insertATodo(Todo todo);

  @Query('SELECT * FROM Todo')
  Future<List<Todo>> retriveTodos();

  @Query('SELECT * FROM Todo order by id desc limit 1')
  Future<Todo?> getMaxTodo();

  @Query('SELECT * FROM Todo WHERE worktype = :type')
  Future<List<Todo>> retriveTodosByWorkType(String type);

  @Query('SELECT * FROM Todo WHERE worktype = :type, completed = :completed')
  Future<List<Todo>> getTodoByStatus(String type, bool completed);

  @Query(' SELECT * FROM Time')
  Future<List<Todo>> retriveTime();

  @Query('SELECT * FROM Date')
  Future<List<Todo>> retriveDate();
}
