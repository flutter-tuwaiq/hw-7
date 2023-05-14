import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../../server.dart';

Future<Response> teacherSignup(Request req) async {
  try {
    final data = json.decode(await req.readAsString());

    var name = data["name"];
    var email = data["email"];
    var username = data["username"];
    var password = data["password"];

    var existingTeacher;
    if (teachers.isEmpty) {
      teachers.add({
        "name": name,
        "email": email,
        "username": username,
        "password": password,
      });
    } else {
      existingTeacher =
          teachers.firstWhere((teacher) => teacher["username"] == username);
    }
    if (existingTeacher != null) {
      return Response.internalServerError(
        body: json.encode("Username already taken"),
      );
    }
    // for checking
    print(teachers);

    return Response.ok("You successfully signed up!");
  } catch (e) {
    print(e);
  }
  throw Exception();
}
