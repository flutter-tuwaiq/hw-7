import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../../server.dart';

Future<Response> teacherPost(Request req) async {
  try {
    final data = json.decode(await req.readAsString());

    teachersPost.add(data);
    print(teachersPost);

    return Response.ok("Post created successfully!");
  } catch (e) {
    print(e);
  }
  throw Exception();
}