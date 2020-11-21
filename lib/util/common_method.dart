import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'constant.dart';

navigateTo(BuildContext context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

/*Future<void> getUser() async {
  String str = await GetValue.string(Keys.user);
  user = User.fromJson(jsonDecode(str));
  token = user.token;
}

Future<bool> isLogin() async {
  String str = await GetValue.string(Keys.token);
  return str == null || str == "" ? false : true;
}

Future<void> saveUser(User userObject) async {
  final str = jsonEncode(userObject.toJson());
  await SaveValue.string(Keys.user, str);
  await SaveValue.string(Keys.token, userObject.token);
  user = userObject;
  token = user.token;
}

Future<bool> logout() async {
  return await Value.clear();
}*/

Future<bool> isInternetConnected() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}

// bool validateEmail(String email) {
//   if (email != "") {
//     return RegExp(regValidateEmail).hasMatch(email);
//   }
//   return true;
// }

snackBarAlert(GlobalKey<ScaffoldState> scaffoldKey, String message) {
  scaffoldKey.currentState.showSnackBar(SnackBar(
    content: Text(
      message,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    backgroundColor: Colors.redAccent,
  ));
}

snackBarSuccess(GlobalKey<ScaffoldState> scaffoldKey, String message) {
  scaffoldKey.currentState.showSnackBar(SnackBar(
    content: Text(
      message,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    backgroundColor: Colors.green,
  ));
}
String formatDate(String strDate , String format){
  var date = DateTime.parse(strDate);
  var formatter = DateFormat(format);
  return formatter.format(date);
}
