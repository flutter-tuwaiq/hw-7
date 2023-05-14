import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../../server.dart';

loginResponse(Request req) async {
  final Map userLogin = jsonDecode(await req.readAsString());
  List userdata = [];

  // check from user type to bring its data list
  if (userType == "student") {
    userdata = studentData;
  }
  if (userType == "teacher") {
    userdata = techerData;
  }
  if (userType == "boss") {
    userdata = bossData;
  }

  try {
    // Check if the entered username MATCHES the username in database
    final selectedUser = userdata
        .firstWhere((user) => user["username"] == userLogin["username"]);

    // Check if the password is correct
    if (selectedUser["password"] != userLogin["password"]) {
      return Response.forbidden(
        "You have entered WRONG password, try again!",
      );
    }

    return Response.ok(
      "Logged in. \n$userLogin",
      headers: {"Content-Type": "Application/json"},
    );
  } catch (e) {
    // if the username is not found in database
    return Response.forbidden(
      "There is No username found! please Sign up first",
    );
  }
}
