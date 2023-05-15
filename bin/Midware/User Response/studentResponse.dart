// ignore_for_file: file_names

import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../../server.dart';

// List<Map> userInfo = [];
// List<Map> posts = [];

// Login Response: check if user have an account and return his info
loginResponse(Request req) async {
  try {
    final body = await req.readAsString();
    final Map jsonBody = json.decode(body);
    Map user = students.firstWhere((user) =>
        user["username"] == jsonBody["username"] &&
        user["password"] == jsonBody["password"]);
    if (user.isNotEmpty) {
      return Response.ok(
        json.encode(user),
        headers: {'Content-Type': 'Application/json'},
      );
    }
  } catch (error) {
    return Response.notFound('Unexpected error occured... (login student)');
  }
}

// Signup Response: check if all required data is recived and user is new
signupResponse(Request req) async {
  try {
    final body = await req.readAsString();
    final Map jsonBody = json.decode(body);

    //check if keys exsistes
    if (!jsonBody.containsKey("username")) {
      if (!jsonBody.containsKey("password")) {
        if (!jsonBody.containsKey("name")) {
          if (!jsonBody.containsKey("email")) {
            Response.notFound("Please fill the signup form");
          }
        }
      }
    } else {
      if (students.isNotEmpty) {
        Map user = students.firstWhere((user) =>
            user["username"] == jsonBody["username"] &&
            user["password"] == jsonBody["password"]);
        //check if there is another account with the same username or email
        if (user["email"] == jsonBody["email"]) {
          return Response.notFound('you already have an account');
        } else if (user["username"] == jsonBody["username"]) {
          return Response.notFound('this username is taken');
        }
        students.add(jsonBody);

        return Response.ok('signedup successfully...');
      } else {
        students.add(jsonBody);

        return Response.ok('signedup successfully...');
      }
    }
  } catch (error) {
    return Response.notFound('Unexpected error occured... (signup student)');
  }
}

// sendPost Response: check if all required data is recived and add them
sendpostResponse(Request req) async {
  try {
    final body = await req.readAsString();
    final Map jsonBody = json.decode(body);
    //check if keys exsistes
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
