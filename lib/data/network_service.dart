import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:todo_list/constants/strings.dart';
import 'package:todo_list/data/models/user.dart';
import 'package:todo_list/presentation/shared_prefrences.dart';

class NetworkService {

  final baseUrl = "http://localhost:3000";

  Future<List<dynamic>> fetchTodos() async {
    try {
      final response = await get(Uri.parse(baseUrl + "/todos"));
      print(response.body);
      return jsonDecode(response.body) as List; 
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<bool> patchTodo(Map<String, String> patchObj, int id) async {
    try {

      await patch(Uri.parse(baseUrl + "/todos/$id"), body: patchObj);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Map> addTodo(Map<String, String> todoObj) async {
    try {
      final response = await post(Uri.parse(baseUrl + "/todos"), body: todoObj);
      return jsonDecode(response.body);
    } catch (e) {
      rethrow ;
    }
  }

  Future<bool> deleteTodo(int id) async {
    try {
      await delete(Uri.parse(baseUrl + "/todos/$id"));
      return true;
    } catch (er) {
      return false;
    }
  }
  Future<void> registerUser({required context}) async {
    try{


      Map<String, dynamic> regJson = {

        "password":password,
        "userName":userName

      };

      //final Map<String, dynamic> jsonValue = json.decode(regJson);
      NewUser authUser = NewUser.fromJson(regJson);
      await UserPreferences().saveUser(authUser);

      //var res = await UserPreferences().getUser();

      await Future.delayed(const Duration(seconds: 4));

      //push the user to products screen
      Navigator.pushNamed(context, TODO_SCREEN_ROUTE);
    }catch(e){
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.black,
          textColor: Colors.redAccent);
    }
    }
  }
