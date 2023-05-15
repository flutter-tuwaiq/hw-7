import 'package:shelf/shelf.dart';
import 'dart:convert';

List<Map> student = [];
List<Map> studentsPosts = [];

loginResponse(Request req) async {
  final Map sturdents = jsonDecode(await req.readAsString());
  for (var i in student) {
    if (sturdents["username"] == i && sturdents["password"] == i) {
      return Response.ok(
        " login  successfully",
        headers: {"Content-Type": "Application/json"},
      );
    }
  }
}

signUpResponse(Request req) async {
  final Map sturdentSignup = jsonDecode(await req.readAsString());

  student.add(sturdentSignup);

  return Response.ok(
    " signed up successfully",
    headers: {"Content-Type": "Application/json"},
  );
}

sendPostResponse(Request req) async {
  final Map sendPost = jsonDecode(await req.readAsString());

  studentsPosts.add(sendPost);
  print(studentsPosts);

  return Response.ok(
    " post up successfully",
    headers: {"Content-Type": "Application/json"},
  );
}
