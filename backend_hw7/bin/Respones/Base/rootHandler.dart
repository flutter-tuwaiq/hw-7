import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../../server.dart';

Response rootHandler(Request _) {
  return Response.ok(jsonEncode("Hello"));
}
