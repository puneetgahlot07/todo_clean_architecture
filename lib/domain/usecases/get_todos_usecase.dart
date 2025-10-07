import 'dart:developer';

import 'package:todo/core/generics/todo_generice.dart';
import 'package:todo/domain/models/todo.dart';
import 'package:todo/domain/repository/todo_repo.dart';

class GetTodosUseCase extends UseCase<List<Todo>, NoParams> {
  final TodoRepo repository;
  GetTodosUseCase(this.repository);

  @override
  Future<List<Todo>> call(NoParams params) async {
    log(await repository.getTodos().toString());
    return await repository.getTodos();
  }
  // Future<List<Todo>> fetchList() async{
  //   return await repository.getTodos();
  // }
}
