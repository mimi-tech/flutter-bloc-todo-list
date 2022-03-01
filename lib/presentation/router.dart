import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/constants/strings.dart';
import 'package:todo_list/cubit/add_todo_cubit.dart';
import 'package:todo_list/cubit/edit_todo_cubit.dart';
import 'package:todo_list/cubit/todos_cubit.dart';
import 'package:todo_list/data/models/todo.dart';
import 'package:todo_list/data/network_service.dart';
import 'package:todo_list/data/repository.dart';
import 'package:todo_list/presentation/screens/add_todo_screen.dart';
import 'package:todo_list/presentation/screens/edit_todo_screen.dart';
import 'package:todo_list/presentation/screens/todos_screen.dart';


class AppRouter {
 late Repository repository;
  late TodosCubit todosCubit;

  AppRouter() {
    repository = Repository(networkService: NetworkService());
    todosCubit = TodosCubit(repository: repository);
  }

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {


      case "/":
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: todosCubit,
            child: const TodosScreen(),
          ),
        );
      case EDIT_TODO_ROUTE:
        final todo = settings.arguments as Todo;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => EditTodoCubit(
              repository: repository,
              todosCubit: todosCubit,
            ),
            child: EditTodoScreen(todo: todo,),
          ),
        );
      case ADD_TODO_ROUTE:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => AddTodoCubit(
              repository: repository,
              todosCubit: todosCubit,
            ),
            child: AddTodoScreen(),
          ),
        );
      default:
       throw "No route found";
    }
  }
}
