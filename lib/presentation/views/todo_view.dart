import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/models/todo.dart';
import 'package:todo/presentation/todo_cubit.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

// Show dialog to add a new todo
  _showAddTodoBox(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    final textController = TextEditingController();

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: textController,
                decoration: const InputDecoration(hintText: 'Enter todo'),
              ),
              actions: [
                // Cancel Btn
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Cancel")),

                // add Btn

                TextButton(
                    onPressed: () {
                      todoCubit.addTodo(textController.text);
                      Navigator.of(context).pop();
                    },
                    child: const Text("Add"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => _showAddTodoBox(context)),
      // Body Bloc Builder
      body: BlocBuilder<TodoCubit, List<Todo>>(builder: (context, todos) {
        return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ListTile(
                // title todo
                title: Text(todo.text),
                // Check box of todo
                leading: Checkbox(
                    value: todo.isCompleted,
                    onChanged: (value) => todoCubit.toggleTodoCompletion(todo)),

                // Delete btn
                trailing: IconButton(
                    onPressed: () => todoCubit.deleteTodo(todo.id),
                    icon: Icon(Icons.delete)),
              );
            });
      }),
    );
  }
}
