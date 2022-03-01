import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/data/models/user.dart';
class UserPreferences {
Future<bool> saveUser(NewUser user) async {

  final SharedPreferences prefs = await SharedPreferences.getInstance();


  prefs.setString('userName',user.userName ?? "");
  prefs.setString('password',user.password ?? "");


  return prefs.commit();

}



Future<NewUser> getUser ()  async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();


  String userName = prefs.getString("userName") ?? "";
  String password = prefs.getString("password") ?? "";


  return NewUser(

    userName: userName,
    password: password,

  );

}}
