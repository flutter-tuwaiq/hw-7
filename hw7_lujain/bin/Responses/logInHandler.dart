// ignore_for_file: file_names

import 'dart:convert';
import 'package:shelf/shelf.dart';

logInHandler(Request req) async {
  final body = req.readAsString();
  final jsonBody = json.decode(await body);
  List user = [];

  try {
    final selectedUser =
        user.firstWhere((user) => user["username"] == jsonBody["username"]);

    // Check if the password is correct
    if (selectedUser["password"] != jsonBody["password"]) {
      return Response.forbidden(
        "Wrong password, try again!",
      );
    }

    return Response.ok(
      "$jsonBody",
      headers: {"Content-Type": "Application/json"},
    );
  } catch (e) {
    print(e);
  }
}
