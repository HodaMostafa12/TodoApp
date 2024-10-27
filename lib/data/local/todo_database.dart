import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/data/model/todo.dart';

class TodoDatabase {
  //single instante from data base
  static final TodoDatabase instance = TodoDatabase._init();

  static Database? _database;
  TodoDatabase._init();

  //git database instanse
  Future<Database> get database async {
    //if data base not empty return it
    if (_database != null) return _database!;
    //otherwise,initialize database
    _database = await _initDB('todo.db');
    return _database!;
  }

  //method to intialize sql database
  Future<Database> _initDB(String filepath) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filepath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

//method that create database schema
  FutureOr<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE todos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        task TEXT NOT NULL,
        description TEXT NOT NULL,
        isComplated INTEGER NOT NULL
      )
    ''');
  }

  //this method to fetch all database
  Future<List<Todo>> getallTodos() async {
    final db = await instance.database;
    final result = await db.query('todos');

    //convert each map to row
    return result.map((json) => Todo.fromMap(json)).toList();
  }

  //Method to insert a now todo inti the database
  Future<int> addTodo(Todo todo) async {
    final db = await instance.database;

    //insert
    return await db.insert('todos', todo.toMap());
  }

  //Method to update data
  Future<int> updateTodo(Todo todo) async {
    final db = await instance.database;

    //update
    return await db
        .update('todos', todo.toMap(), where: 'id = ?', whereArgs: [todo.id]);
  }

  //Method to delete a todo by its id
  Future<int> deleteToDoById(int id) async {
    final db = await instance.database;

    //delete the row from 'todos table
    return await db.delete('todos', where: 'id = ?', whereArgs: [id]);
  }


}
