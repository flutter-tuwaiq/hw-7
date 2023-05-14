import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../../server.dart';

/*
I created 3 responses for all user type (student, teacher a boss)
to reduce the number of files , but I did a check statements for each 
user type 
*/
createPostResponse(Request req) async {
  final Map post = jsonDecode(await req.readAsString());

  // add the post to the posts database
  posts.add(post);

  return Response.ok(
    "Your post have been created \n$post",
    headers: {"Content-Type": "Application/json"},
  );
}
