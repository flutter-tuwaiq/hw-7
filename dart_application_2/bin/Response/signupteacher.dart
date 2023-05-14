import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

import '../../server.dart';

Future<Response> signUpStudent(Request req) async {
  try {
       List <Map<String,dynamic>> teachers=[];
    final data = json.decode(await req.readAsString());

    var name = data["name"];
    var email = data["email"];
    var username = data["username"];
    var password = data["password"];
    var Teacherout;
    if (teachers.isEmpty) {
      teachers.add({
        "name": name,
        "email": email,
        "username": username, "password": password, });
    } else {
      Teacherout =teachers.firstWhere((teacher) => teacher["username"] == username);
    }
    if (Teacherout != isNotEmpty) {
      return Response.internalServerError(
        body: json.encode("Username already taken"),
      );
    }
    print(teachers);
    return Response.ok("You successfully signed up!");
  } catch (e) {
    print(e);
  }
  throw Exception();
}