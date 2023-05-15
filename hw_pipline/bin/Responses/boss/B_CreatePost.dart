import 'dart:convert';

import 'package:shelf/shelf.dart';


List<Map> B_post = [];

B_CreatePost(Request req) async {
  Map B_new_post = jsonDecode(await req.readAsString());

  B_post.add(B_new_post);

  return Response.ok( '$B_new_post', headers: {"Content-Type": "Application/json"},);
}
