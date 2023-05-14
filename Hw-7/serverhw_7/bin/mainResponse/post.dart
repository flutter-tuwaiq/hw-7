import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../server.dart';


createPostResponse(Request req) async {
  final Map post = jsonDecode(await req.readAsString());

  var posts;
  posts.add(post);

  return Response.ok(
    "Your post have been created \n$post",
    headers: {"Content-Type": "Application/json"},
  );
}