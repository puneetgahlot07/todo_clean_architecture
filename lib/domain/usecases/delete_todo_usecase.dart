import 'package:todo/core/generics/todo_generice.dart';
import 'package:todo/domain/repository/todo_repo.dart';

class DeleteTodoUseCase extends UseCase<void, int> {
  final TodoRepo repository;
  DeleteTodoUseCase(this.repository);

  @override
  Future<void> call(int id) async {
    return await repository.deleteTodo(id);
  }
  // Future<void> deleteTodo(int id) async {
  //   return await repository.deleteTodo(id);
  // }
}
