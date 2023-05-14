import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../../server.dart';

Future<Response> studentPost(Request req) async {
  try {
    final data = json.decode(await req.readAsString());

    studentsPost.add(data);
    print(studentsPost);

    return Response.ok("Post created successfully!");
  } catch (e) {
    print(e);
  }
  throw Exception();
}
