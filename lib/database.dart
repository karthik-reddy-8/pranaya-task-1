// the generated code will be there

import 'package:floor/floor.dart';
import 'package:flutter_todo_task/todo_dao.dart';

import 'model_class.dart';

@Database(version: 1, entities: [Todo])
abstract class TodoDatabase extends FloorDatabase {
  TodoDAO get todoDAO;
}
