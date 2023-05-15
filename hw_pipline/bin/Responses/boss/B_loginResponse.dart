import 'dart:convert';

import 'package:shelf/shelf.dart';



B_loginResponse(Request req) async {
 
    try {
      final jsonBody = json.decode(await req.readAsString());
      List B_userInfo = [];

      final selectedUser =
          B_userInfo.firstWhere((user) => user["username"] == jsonBody["username"]);

      if (selectedUser["password"] != jsonBody["password"]) {
        return Response.forbidden(
          "Wrong password!",
        );
      }

      return Response.ok(
        "$jsonBody",
        headers: {"Content-Type": "Application/json"},
      );
    } catch (e) {
      print(e);
      return Response.forbidden(
        "user Not found !",
      );
    }
  }

