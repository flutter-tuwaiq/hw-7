// TODO Implement this library.



import 'dart:convert';
import 'package:shelf/shelf.dart';

List<Map> user1 = [];

signup(Request req) async {
    var User;
    final body = req.readAsString();
    final jsonBody = json.decode(await body);



    if (user1.isEmpty) {
      user1.add({"name": jsonBody["name"], "email": jsonBody["email"],
        "username": jsonBody["username"],"password": jsonBody["password"],
      });


    } else {
      User = user1 .firstWhere((student) => student["username"] == jsonBody["username"]);
    }

    if (User != null) {
      return Response.internalServerError(
        body: json.encode("Username already there"),
      );
    }
    
    return Response.ok("successfully signed up!");
 
}