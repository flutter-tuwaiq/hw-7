import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../../server.dart';

Future<Response> postteachr(Request req) async {
  try {
       List <Map<String,dynamic>> teachersPost=[];
    final info = json.decode(await req.readAsString());
    teachersPost.add(info);
    print(teachersPost);
    return Response.ok("Post created successfully!");
  } catch (e) {
    print(e);
  }
      return Response.ok("not post");

} 