//this file interact with viewmodel , allow viewmodel ineract with function without interact with database code

//الوسيط بين databaseوالviewmodel

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data/local/todo_database.dart';
import 'package:todo_app/data/model/todo.dart';

class TodoRepo {
  final TodoDatabase _todoDatabase = TodoDatabase.instance;

  //fetch all data
  Future<List<Todo>> getAllTodos() async {
    return _todoDatabase.getallTodos();
  }

  //add a new todo to the database
  Future<int> addTodo(Todo todo) async {
    return await _todoDatabase.addTodo(todo);
  }

  //update
  Future<int> updateTodo(Todo todo) async {
    return await _todoDatabase.updateTodo(todo);
  }

  //delete
  Future<int> deleteTodo(int id) async {
    return await _todoDatabase.deleteToDoById(id);
  }


}
