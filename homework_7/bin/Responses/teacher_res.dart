import 'dart:convert';
import 'package:shelf/shelf.dart';

List<Map> teachers = [];
List<Map> teachersPosts = [];

Future<Response> loginHandler(Request req) async {
  try {
    final body = await req.readAsString();
    final Map jsonBody = json.decode(body);

    if (jsonBody.keys.toString() != "(username, password)") {
      return Response.badRequest(body: 'Invalid input');
    }

    for (var teacher in teachers) {
      if (teacher["username"] == jsonBody["username"] &&
          teacher["password"] == jsonBody["password"]) {
        return Response.ok(
          json.encode(jsonBody),
          headers: {'Content-Type': 'Application/json'},
        );
      }
    }

    return Response.notFound("You don't have an account!");
  } catch (e) {
    print(e);
  }

  return Response.badRequest(body: 'Invalid input');
}

Future<Response> signinHandler(Request req) async {
  try {
    final body = await req.readAsString();
    final Map jsonBody = json.decode(body);

    if (jsonBody.keys.toString() != "(name, email, username, password)") {
      return Response.badRequest(body: 'Invalid input');
    }

    teachers.add(jsonBody);

    return Response.ok(
      json.encode(jsonBody),
      headers: {'Content-Type': 'Application/json'},
    );
  } catch (e) {
    print(e);
  }

  return Response.badRequest(body: 'Invalid input');
}

Future<Response> sendPostHandler(Request req) async {
  try {
    final body = await req.readAsString();
    final Map jsonBody = json.decode(body);

    if (jsonBody.keys.toString() != "(title, content)") {
      return Response.badRequest(body: 'Invalid input');
    }

    teachersPosts.add(jsonBody);

    return Response.ok(
      json.encode(jsonBody),
      headers: {'Content-Type': 'Application/json'},
    );
  } catch (e) {
    print(e);
  }

  return Response.badRequest(body: 'Invalid input');
}
