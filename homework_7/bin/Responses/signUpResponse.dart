import 'dart:convert';
import 'package:shelf/shelf.dart';

signUpResponse(Request req) async {
  List users = [];

  final body = req.readAsString();
  final jsonBody = json.decode(await body);

  final User =
      users.firstWhere((user) => user["username"] == jsonBody["username"]);

  if (User["password"] != jsonBody["password"]) {
    return Response.forbidden(
      "  plese try again",
    );
  }

  return Response.ok(
    "$jsonBody",
    headers: {"Content-Type": "Application/json"},
  );
}
