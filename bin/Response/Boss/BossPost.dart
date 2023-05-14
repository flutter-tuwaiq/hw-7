import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../../server.dart';

Future<Response> bossPost(Request req) async {
  try {
    final data = json.decode(await req.readAsString());

    bossesPost.add(data);
    print(bossesPost);

    return Response.ok("Post created successfully!");
  } catch (e) {
    print(e);
  }
  throw Exception();
}