import 'dart:convert';
import 'package:shelf/shelf.dart';

List<Map> bosses = [];
List<Map> bossesPosts = [];

Future<Response> loginHandler(Request req) async {
  try {
    final body = await req.readAsString();
    final Map jsonBody = json.decode(body);

    if (jsonBody.keys.toString() != "(username, password)") {
      return Response.badRequest(body: 'Invalid input');
    }

    for (var boss in bosses) {
      if (boss["username"] == jsonBody["username"] &&
          boss["password"] == jsonBody["password"]) {
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

    bosses.add(jsonBody);

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

    bossesPosts.add(jsonBody);

    return Response.ok(
      json.encode(jsonBody),
      headers: {'Content-Type': 'Application/json'},
    );
  } catch (e) {
    print(e);
  }

  return Response.badRequest(body: 'Invalid input');
}
