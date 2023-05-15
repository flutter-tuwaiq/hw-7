// ignore_for_file: file_names

import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../../server.dart';


// Login Response: check if user have an account and return his info
loginResponse(Request req) async {
try {
    final body = await req.readAsString();
    final Map jsonBody = json.decode(body);
    Map user = students.firstWhere((user) =>
        user["username"] == jsonBody["username"] &&
        user["password"] == jsonBody["password"]);
    if (user.isNotEmpty) {
      return Response.ok(json.encode(user),
          headers: {'Content-Type': 'Application/json'},);
    }
  } catch (error) {
    return Response.notFound('Unexpected error occured...');
  }}

// Signup Response: check if all required data is recived and user is new
signupResponse(Request req) async {
  try {
    final body = await req.readAsString();
    final Map jsonBody = json.decode(body);

    Map user = students.firstWhere((user) =>
        user["username"] == jsonBody["username"] &&
        user["password"] == jsonBody["password"]);

    if (!jsonBody.containsKey("username")) {
      if (!jsonBody.containsKey("password")) {
        if (!jsonBody.containsKey("name")) {
          if (!jsonBody.containsKey("email")) {
            Response.notFound("Please fill the signup form");
          }
        }
      }
    } else {
      if (user["email"] == jsonBody["email"]) {
        return Response.notFound('you already have an account');
      } else if (user["username"] == jsonBody["username"]) {
        return Response.notFound('this username is taken');
      }
      students.add(jsonBody);

      return Response.ok('signedup successfully...');
    }
  } catch (error) {
    return Response.notFound('Unexpected error occured...');
  }
}

// sendPost Response: check if all required data is recived and add them
sendpostResponse(Request req) async {
  try {
    final body = await req.readAsString();
    final Map jsonBody = json.decode(body);

    if (!jsonBody.containsKey("title")) {
      if (!jsonBody.containsKey("content")) {
        Response.notFound("Please fill the signup form");
      }
    } else {
      posts.add(jsonBody);

      return Response.ok('added successfully...');
    }
  } catch (error) {
    return Response.notFound('Unexpected error occured...');
  }
}
