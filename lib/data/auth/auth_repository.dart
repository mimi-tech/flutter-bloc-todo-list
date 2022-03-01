import 'package:flutter/cupertino.dart';
import 'package:todo_list/data/network_service.dart';

class AuthRepository {
  final BuildContext context;

  AuthRepository({required this.context});
  Future<void> login() async {
    NetworkService().registerUser(context: context);
  }
}