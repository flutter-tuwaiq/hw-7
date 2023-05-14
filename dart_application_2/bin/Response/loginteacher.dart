import 'dart:convert';

import 'package:shelf/shelf.dart';
import '../../server.dart';

Future<Response> loginteacher(Request req) async {
  try {

   List <Map<String,dynamic>> teachers=[];
    final data = json.decode(await req.readAsString());
    var username = data["username"];
    var password = data["password"];
    Map<String, dynamic> existingTeacher;
    if (teachers.isNotEmpty) {
      existingTeacher =
          teachers.firstWhere((teacher) => teacher["username"] == username);
    } else {
      return Response.forbidden("Invalid username or password");
    }

    return existingTeacher["password"] == password ? Response.ok("you have logged successfully!") : Response.forbidden("Invalid username or password");
  } catch (e) {
    print(e);
  }
  throw Exception();
} 