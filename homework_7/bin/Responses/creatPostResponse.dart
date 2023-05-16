import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

List<Map> posts = [];

creatPostResponse(Request req) async {
  final body = req.readAsString();
  final jsonBody = jsonDecode(await body);

  posts.add(jsonBody);

  return Response.ok(
    "$jsonBody",
    headers: {"Content-Type": "Application/json"},
  );
}
