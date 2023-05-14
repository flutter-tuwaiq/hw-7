import 'dart:convert';
import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

Future<Response> signupost(Request req) async {
  try {
    List <Map<String,dynamic>> bossone=[];
    final data = json.decode(await req.readAsString());
    var name = data["name"];
    var email = data["email"];
    var username = data["username"];
    var password = data["password"];
    if (bossone.isEmpty) {
      bossone.add({
        "name": name,
        "email": email,
        "username": username,
        "password": password,
      });
    } else {var out =bossone.firstWhere((elem) => elem["username"] == username);}
    var out;
    if (out != null) {
      return Response.internalServerError(
        body: json.encode("Username already in")
      );
    }
    print(bossone);
    return Response.ok("You successfully signed up!");
  } catch (Error) {
    print(Error);
  }
   return Response.ok("not successfully!");

}