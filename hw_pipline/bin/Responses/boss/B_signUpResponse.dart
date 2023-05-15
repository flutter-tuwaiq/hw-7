import 'dart:convert';

import 'package:shelf/shelf.dart';

 
List<Map> B_userInfo = [];

    
    
B_signUpResponse(Request req) async {
    final jsonBody = json.decode(await req.readAsString());
    var user_check;

    if (B_userInfo.isEmpty) {
      B_userInfo.add({
        "name": jsonBody["name"],
        "email": jsonBody["email"],
        "username": jsonBody["username"],
        "password": jsonBody["password"],
      });


      
    } else {
      user_check = B_userInfo.firstWhere((a) => a["username"] == jsonBody["username"]);
    }
    if (user_check != null) {
      return Response.internalServerError(
        body: json.encode("Username already taken"),
      );
    }

    return Response.ok(" signed up!");
  
}
