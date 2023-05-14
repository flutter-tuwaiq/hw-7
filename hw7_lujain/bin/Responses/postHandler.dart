import 'dart:convert';

import 'package:shelf/shelf.dart';

List<Map> post = [];

postHandler(Request req) async {
  try {
    final body = req.readAsString();
    final jsonBody = jsonDecode(await body);

    post.add(jsonBody);

    return Response.ok(
      "$jsonBody",
      headers: {"Content-Type": "Application/json"},
    );
    
  } catch (e) {
    print(e);
  }
}
