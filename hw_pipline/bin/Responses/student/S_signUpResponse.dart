import 'dart:convert';

import 'package:shelf/shelf.dart';

List<Map> S_userInfo = [];

S_signUpResponse(Request req) async {
  
    
    final jsonBody = json.decode(await req.readAsString());

    var existUser;

    if (S_userInfo.isEmpty) {
      S_userInfo.add({
        "name": jsonBody["name"],
        "email": jsonBody["email"],
        "username": jsonBody["username"],
        "password": jsonBody["password"],
      });
    } else {
      existUser = S_userInfo .firstWhere((a) => a["username"] == jsonBody["username"]);
    }
    if (existUser != null) {
      return Response.internalServerError(
        body: json.encode("Username already taken"),
      );
    }

    return Response.ok("You successfully signed up!");
  
}
