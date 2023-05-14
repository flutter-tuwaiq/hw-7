import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../../server.dart';

Future<Response> studentLogin(Request req) async {
  try {
    final data = json.decode(await req.readAsString());

    var username = data["username"];
    var password = data["password"];

    Map<String, dynamic> existingStudent;
    if (students.isNotEmpty) {
      existingStudent =
          students.firstWhere((student) => student["username"] == username);
    } else {
      return Response.forbidden("Invalid username or password");
    }

    return existingStudent["password"] == password ? Response.ok("you have logged successfully!") : Response.forbidden("Invalid username or password");
  } catch (e) {
    print(e);
  }
  throw Exception();
}
