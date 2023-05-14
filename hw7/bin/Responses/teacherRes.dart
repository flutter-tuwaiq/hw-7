import 'dart:convert';
import 'package:shelf/shelf.dart';

List<Map> teacher = [];
List<Map> teachersPosts = [];

// login checks
loginResponse(Request req) async {
  final Map teachers = jsonDecode(await req.readAsString());

  for (var i in teacher) {
    if (teachers["username"] == i && teachers["password"] == i) {
      return Response.ok(
        " login  successfully",
        headers: {"Content-Type": "Application/json"},
      );
    }
  }
}

// singing checks
signUpResponse(Request req) async {
  final Map teacherSignup = jsonDecode(await req.readAsString());
  teacher.add(teacherSignup);
  print(teacher);

  return Response.ok(
    " signed up successfully",
    headers: {"Content-Type": "Application/json"},
  );
}

// post check
sendPostResponse(Request req) async {
  final Map sendPost = jsonDecode(await req.readAsString());

  // adding to the empty list
  teachersPosts.add(sendPost);

  return Response.ok(
    " signed up successfully",
    headers: {"Content-Type": "Application/json"},
  );
}
