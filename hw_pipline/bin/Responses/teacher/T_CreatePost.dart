import 'dart:convert';

import 'package:shelf/shelf.dart';

List<Map> T_post = [];

T_CreatePost(Request req) async {
  Map T_new_post = jsonDecode(await req.readAsString());

  T_post.add(T_new_post);

  return Response.ok(
    '$T_new_post',
    headers: {"Content-Type": "Application/json"},
  );
}
