import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../server.dart';

loginResponse(Request req) async {
  final Map userLogin = jsonDecode(await req.readAsString());
  List userdata = [];

  var typeU;
  if (typeU == "student") {
    userdata = stdList;
  }
  if (typeU == "teacher") {
    userdata = tetList;
  }
  if (typeU == "boss") {
    userdata = bossList;
  }

  try {
    final selectedUser = userdata
        .firstWhere((user) => user["username"] == userLogin["username"]);

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
    return Response.forbidden(
      "There is No username found! please Sign up first",
    );
  }
}