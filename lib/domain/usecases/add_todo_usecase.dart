import 'package:todo/core/generics/todo_generice.dart';
import 'package:todo/domain/models/todo.dart';
import 'package:todo/domain/repository/todo_repo.dart';

class AddTodoUseCase extends UseCase<void, Todo> {
  final TodoRepo repository;
  AddTodoUseCase(this.repository);

  @override
  Future<void> call(Todo newTodo) async {
    return await repository.addTodo(newTodo);
  }

  // Future<void> addtodo(Todo newTodo) async {
  //   return await repository.addTodo(newTodo);
  // }
}
