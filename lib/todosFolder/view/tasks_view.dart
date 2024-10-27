import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/todosFolder/view_model/todo_veiw_modil.dart';
import '../../data/model/todo.dart';

class TodoListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return ListTile(
            title: Text(todo.task),
            subtitle: Text(todo.description),
            trailing: Checkbox(
              value: todo.isComplated,
              onChanged: (value) {
                ref.read(todoProvider.notifier).updateTodo(
                      Todo(
                        id: todo.id,
                        task: todo.task,
                        description: todo.description,
                        isComplated: value ?? false,
                      ),
                    );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTodoDialog(context, ref),
        child: Icon(Icons.add),
      ),
    );
  }

  void _addTodoDialog(BuildContext context, WidgetRef ref) {
    final taskController = TextEditingController();
    final descController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Add Todo'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                controller: taskController,
                decoration: InputDecoration(labelText: 'Task')),
            TextField(
                controller: descController,
                decoration: InputDecoration(labelText: 'Description')),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              final newTodo = Todo(
                task: taskController.text,
                description: descController.text,
                isComplated: false,
              );
              ref.read(todoProvider.notifier).addTodo(newTodo);
              Navigator.of(context).pop();
            },
            child: Text('Add'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
