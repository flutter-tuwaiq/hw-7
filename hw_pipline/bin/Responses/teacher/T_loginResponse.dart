import 'dart:convert';

import 'package:shelf/shelf.dart';



T_loginResponse(Request req) async {
 
    try {
     
      final jsonBody = json.decode(await req.readAsString());
      List T_userInfo = [];

      final selectedUser = T_userInfo.firstWhere((user) => user["username"] == jsonBody["username"]);

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
        "Not found !",
      );
    }
  }

