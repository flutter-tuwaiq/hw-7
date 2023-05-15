import 'dart:convert';

import 'package:shelf/shelf.dart';


List<Map> S_post = [];

S_CreatePost(Request req) async {
  Map S_new_post = jsonDecode(await req.readAsString());

  S_post.add(S_new_post);


 return Response.ok( '$S_new_post', headers: {"Content-Type": "Application/json"},);

}
