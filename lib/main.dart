import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/presentation/router.dart';

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
      onGenerateRoute: router.generateRoute,
      // home: RepositoryProvider(
      //   create: (context) => AuthRepository(),
      //   child: LoginScreen(),
      // ),,
    );
  }
}