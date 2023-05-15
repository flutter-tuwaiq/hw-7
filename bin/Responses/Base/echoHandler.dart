// ignore_for_file: file_names

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

Response echoHandler(Request request) {
  final message = request.params['message'];

  return Response.ok(" hello $message");
}
