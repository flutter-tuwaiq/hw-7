import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../../server.dart';

Future<Response> studentSignup(Request req) async {
  try {
    final data = json.decode(await req.readAsString());

    var name = data["name"];
    var email = data["email"];
    var username = data["username"];
    var password = data["password"];

    var existingStudent;
    if (students.isEmpty) {
      students.add({
        "name": name,
        "email": email,
        "username": username,
        "password": password,
      });
    } else {
      existingStudent =
          students.firstWhere((student) => student["username"] == username);
    }
    if (existingStudent != null) {
      return Response.internalServerError(
        body: json.encode("Username already taken"),
      );
    }

    // for checking
    print(students);

    return Response.ok("You successfully signed up!");
  } catch (e) {
    print(e);
  }
  throw Exception();
}
