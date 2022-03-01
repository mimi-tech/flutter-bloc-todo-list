import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/data/auth/auth_repository.dart';
import 'package:todo_list/data/network_service.dart';
import 'package:todo_list/presentation/router.dart';
import 'package:todo_list/presentation/screens/login_screen.dart';

void main() {
  runApp(TodoApp(
    router: AppRouter(),
  ));
}

class TodoApp extends StatelessWidget {

  final AppRouter router;

  const TodoApp({Key? key, required this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //onGenerateRoute: router.generateRoute,
      home: RepositoryProvider(
        create: (context) => AuthRepository(context: context),
        child: LoginScreen(),
      ),
    );
  }
}