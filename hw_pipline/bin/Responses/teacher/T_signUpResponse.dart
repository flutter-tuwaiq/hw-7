import 'dart:convert';

import 'package:shelf/shelf.dart';

 
List<Map> T_userInfo = [];

T_signUpResponse(Request req) async {
  
    
    final jsonBody = json.decode(await req.readAsString());

    var existUser;

    if (T_userInfo.isEmpty) {
      T_userInfo.add({
        "name": jsonBody["name"],
        "email": jsonBody["email"],
        "username": jsonBody["username"],
        "password": jsonBody["password"],
      });
    } else {
      existUser = T_userInfo
          .firstWhere((a) => a["username"] == jsonBody["username"]);
    }
    if (existUser != null) {
      return Response.internalServerError(
        body: json.encode("Username already taken"),
      );
    }

    return Response.ok("You successfully signed up!");
  
}
