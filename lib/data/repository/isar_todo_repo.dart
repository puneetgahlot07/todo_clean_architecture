import 'package:isar/isar.dart';
import 'package:todo/data/models/isar_todo.dart';
import 'package:todo/domain/models/todo.dart';
import 'package:todo/domain/repository/todo_repo.dart';

class IsarTodoRepo implements TodoRepo {
  final Isar db;

  IsarTodoRepo(this.db);

  // get List of todos
  @override
  Future<List<Todo>> getTodos() async {
    final todos = await db.todoIsars.where().findAll();
    return todos.map((ele) => ele.toDomain()).toList();
  }

  // add todo
  @override
  Future<void> addTodo(Todo newTodo) {
    final todo = TodoIsar.fromDomain(newTodo);
    return db.writeTxn(() => db.todoIsars.put(todo));
  }

  // update todo
  @override
  Future<void> updateTodo(Todo todo) {
    final todoIsar = TodoIsar.fromDomain(todo);
    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

  // delete todo
  @override
  Future<void> deleteTodo(int id) async {
    return db.writeTxn(() => db.todoIsars.delete(id));
  }
}
