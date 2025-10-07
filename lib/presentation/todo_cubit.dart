import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/generics/todo_generice.dart';
import 'package:todo/domain/models/todo.dart';
import 'package:todo/domain/repository/todo_repo.dart';
import 'package:todo/domain/usecases/add_todo_usecase.dart';
import 'package:todo/domain/usecases/delete_todo_usecase.dart';
import 'package:todo/domain/usecases/get_todos_usecase.dart';
import 'package:todo/domain/usecases/update_todo_usecase.dart';
// import 'package:todo/domain/usecases/get_todos_usecase.dart';

class TodoCubit extends Cubit<List<Todo>> {
  final TodoRepo todoRepo;

// // Example usage

  TodoCubit(this.todoRepo) : super([]) {
    // init();
    loadTodos();
  }

  // Load todos from repository
  Future<void> loadTodos() async {
    final todoList = await todoRepo.getTodos();

    // Emit Todo List
    emit(todoList);
  }

  // Add a new todo
  Future<void> addTodo(String text) async {
    // Create a new Todo object
    final newTodo = Todo(
      id: DateTime.now().millisecondsSinceEpoch,
      text: text,
    );
    // save todo to repository
    await todoRepo.addTodo(newTodo);
    // reload todos
    loadTodos();
  }

  // delete a todo
  Future<void> deleteTodo(int id) async {
    // delete todo from repository
    await todoRepo.deleteTodo(id);

    // reload todos
    loadTodos();
  }

  // toggle completion status of a todo
  Future<void> toggleTodoCompletion(Todo todo) async {
    // toggle completion status update
    final updatedTodo = todo.toggleCompletion();
    // update todo in repository
    await todoRepo.updateTodo(updatedTodo);

    // reload todos
    loadTodos();
  }

  // UseCase check Code
  /*
  init() async {
    final getTodosUseCase = GetTodosUseCase(todoRepo);
    final addTodoUseCase = AddTodoUseCase(todoRepo);
    final updateTodoUseCase = UpdateTodoUseCase(todoRepo);
// ignore: unused_local_variable
    final deleteTodoUseCase = DeleteTodoUseCase(todoRepo);
// get Todos
    final todos = await getTodosUseCase(NoParams());
    for (final todo in todos) {
      log(todo.id.toString());
      // log(todo.text.toString());
    }
    // log(todos.toString());

    // add New Todo

    // await addTodoUseCase(Todo(
    //   text: 'New Todo',
    //   id: DateTime.now().millisecondsSinceEpoch,
    // ));

    // Update Todos
    await updateTodoUseCase(todos.last.toggleCompletion());

    // Delete Todo
    // await deleteTodoUseCase(1759750475930);

    loadTodos();
// await deleteTodoUseCase(todo.id);
  }
   */
}
