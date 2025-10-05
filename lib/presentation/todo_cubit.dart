import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/models/todo.dart';
import 'package:todo/domain/repository/todo_repo.dart';

class TodoCubit extends Cubit<List<Todo>> {
  final TodoRepo todoRepo;

  TodoCubit(this.todoRepo) : super([]) {
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
}
