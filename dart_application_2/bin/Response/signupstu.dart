import 'dart:convert';
import 'dart:convert';

import 'package:shelf/shelf.dart';

Future<Response> siginupstud(Request req) async {
  try {
    List <Map<String,dynamic>> student=[];

    final data = json.decode(await req.readAsString());
    var name = data["name"];
    var email = data["email"];
    var username = data["username"];
    var password = data["password"];
    var studout;
    if (student.isEmpty) {
      student.add({
        "name": name,
        "email": email,
        "username": username,
        "password": password,
      });
    } else {
      studout =
          student.firstWhere((elem) => elem["username"] == username);
    }
    if (studout != null) {
      return Response.internalServerError(
        body: json.encode("Username already taken"),
      );
    }
    print(studout);
    return Response.ok("You successfully signed up!");
  } catch (e) {
    print(e);
  }
      return Response.ok("not successfully!");

}