import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data/repository.dart/repo.dart';
import 'package:todo_app/data/model/todo.dart';
import 'package:uuid/uuid.dart';

//this provider allow accessing the todo repo instanse throughout the app
/// Provider for TodoNotifier to be used throughout the app.
final todoProvider = StateNotifierProvider<TodoNotifier, List<Todo>>((ref) {
  return TodoNotifier(TodoRepo());
});

//manage state with reverpuds
class TodoNotifier extends StateNotifier<List<Todo>> {
  final TodoRepo _repo;
  TodoNotifier(this._repo) : super([]) {
    _fetchTodos();
  }

  Future<void> _fetchTodos() async {
    final todos = await _repo.getAllTodos();
    state = todos;
  }

  //add a new todo to database
Future<void> addTodo(Todo todo) async {
    await _repo.addTodo(todo);
    state = [...state, todo];
  }


  //update an existing todo
  Future<void> updateTodo(Todo todo) async {
    await _repo.updateTodo(todo);
    await _fetchTodos();
  }

  //delete
  Future<void> deleteTodoById(String id) async {
    await _repo.deleteTodo(int.parse(id));
    await _fetchTodos();
  }
}
