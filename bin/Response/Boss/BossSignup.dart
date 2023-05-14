import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../../server.dart';

Future<Response> bossSignup(Request req) async {
  try {
    final data = json.decode(await req.readAsString());

    var name = data["name"];
    var email = data["email"];
    var username = data["username"];
    var password = data["password"];

    var existingBoss;
    if (bosses.isEmpty) {
      bosses.add({
        "name": name,
        "email": email,
        "username": username,
        "password": password,
      });
    } else {
      existingBoss =
          bosses.firstWhere((boss) => boss["username"] == username);
    }
    if (existingBoss != null) {
      return Response.internalServerError(
        body: json.encode("Username already taken"),
      );
    }
    // for checking
    print(bosses);

    return Response.ok("You successfully signed up!");
  } catch (e) {
    print(e);
  }
  throw Exception();
}