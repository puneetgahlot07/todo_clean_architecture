import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/repository/todo_repo.dart';
import 'package:todo/presentation/todo_cubit.dart';
import 'package:todo/presentation/views/todo_view.dart';

class TodoPage extends StatelessWidget {
  final TodoRepo todoRepo;
  const TodoPage({super.key, required this.todoRepo});

  // @override
  // void initState() {
  //   super.initState();

  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TodoCubit(todoRepo), child: const TodoView());
  }
}
