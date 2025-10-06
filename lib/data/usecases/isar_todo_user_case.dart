import 'package:isar/isar.dart';
import 'package:todo/data/models/isar_todo.dart';
import 'package:todo/domain/models/todo.dart';

abstract class TodoUseCase {
  Future<void> addTodo(String title);
  Future<void> deleteTodo(int id);
  Future<void> updateTodo(int id, String title);
  Future<List<Todo>> getTodos();
}

class IsarTodoUserCase implements TodoUseCase {
  final Isar db;
  IsarTodoUserCase(this.db);
  // final TodoIsar todoIsar;

  // IsarTodoUserCase(this.todoIsar);
  @override
  Future<void> addTodo(String title) {
    final newTodo = Todo(
      id: DateTime.now().millisecondsSinceEpoch,
      text: title,
    );
    final todo = TodoIsar.fromDomain(newTodo);
    return db.writeTxn(() => db.todoIsars.put(todo));
  }

  @override
  Future<void> deleteTodo(int id) {
    return db.writeTxn(() => db.todoIsars.delete(id));
  }

  @override
  Future<List<Todo>> getTodos() async {
    final todos = await db.todoIsars.where().findAll();
    return todos.map((ele) => ele.toDomain()).toList();
  }

  @override
  Future<void> updateTodo(
    int id,
    String title,
  ) {
    final todo = Todo(
      id: id,
      text: title,
    );
    final todoIsar = TodoIsar.fromDomain(todo);
    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }
}
