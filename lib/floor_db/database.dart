// the generated code will be there

import 'package:floor/floor.dart';
import 'package:flutter_todo_task/floor_db/model_class.dart';
import 'package:flutter_todo_task/floor_db/todo_dao.dart';

@Database(version: 1, entities: [Todo])
abstract class TodoDatabase extends FloorDatabase {
  TodoDAO get todoDAO;
}
