// ignore_for_file: file_names

import 'dart:convert';
import 'package:shelf/shelf.dart';

List<Map> user = [];

signUpHandler(Request req) async {
  try {
    final body = req.readAsString();
    final jsonBody = json.decode(await body);

    var existUser;
    if (user.isEmpty) {
      user.add({
        "name": jsonBody["name"],
        "email": jsonBody["email"],
        "username": jsonBody["username"],
        "password": jsonBody["password"],
      });
    } else {
      existUser = user
          .firstWhere((student) => student["username"] == jsonBody["username"]);
    }
    if (existUser != null) {
      return Response.internalServerError(
        body: json.encode("Username already taken"),
      );
    }

    return Response.ok("You successfully signed up!");
  } catch (e) {
    print(e);
  }
}
