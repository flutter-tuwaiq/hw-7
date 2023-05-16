// TODO Implement this library.


import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

import 'package:http_parser/http_parser.dart';

List<Map> posts = [];

  post( Request req) async {
  
    final body = req.readAsString();
    final jsonBody = jsonDecode(await body);

    posts.add(jsonBody);

    return Response.ok(
      "$jsonBody",
      headers: {"Content-Type": "Application/json"},
    );
    
  
}