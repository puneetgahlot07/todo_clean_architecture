import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo/data/models/isar_todo.dart';
import 'package:todo/data/repository/isar_todo_repo.dart';
import 'package:todo/domain/repository/todo_repo.dart';
import 'package:todo/presentation/pages/todo_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // get application documents directory
  final dir = await getApplicationDocumentsDirectory();
  // run isar instance
  final isar = await Isar.open([TodoIsarSchema], directory: dir.path);
  // intialize the repo with isar database

  final isarRepoTodo = IsarTodoRepo(isar);

  runApp(MyApp(
    todoRepo: isarRepoTodo,
  ));
}

class MyApp extends StatelessWidget {
  final TodoRepo todoRepo;
  const MyApp({super.key, required this.todoRepo});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: TodoPage(todoRepo: todoRepo),
    );
  }
}
