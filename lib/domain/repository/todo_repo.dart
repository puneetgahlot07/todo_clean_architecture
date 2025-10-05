import 'package:todo/domain/models/todo.dart';

abstract class TodoRepo {
  // get List of todos
  Future<List<Todo>> getTodos();

  // add todo

  Future<void> addTodo(Todo todo);

  // update todo
  Future<void> updateTodo(Todo todo);

  // delete todo
  Future<void> deleteTodo(int id);
}
