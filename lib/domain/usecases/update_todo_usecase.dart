import 'package:todo/core/generics/todo_generice.dart';
import 'package:todo/domain/models/todo.dart';
import 'package:todo/domain/repository/todo_repo.dart';

class UpdateTodoUseCase extends UseCase<void, Todo> {
  final TodoRepo repository;
  UpdateTodoUseCase(this.repository);

  @override
  Future<void> call(Todo updateTodo) async {
    return await repository.updateTodo(updateTodo);
  }

  // Future<void> updateTodo(Todo updateTodo) async {
  //   return await repository.updateTodo(updateTodo);
  // }
}
