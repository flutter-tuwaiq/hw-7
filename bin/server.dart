import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';

// Configure routes
// .
int s = 0;

List? sineub = [];

var i = 0;
final router = Router()
  ..get('/stuodint', rootHandler)
  ..get('/echo/<message>', echoHandler);

Response rootHandler(Request _) {
  i++;

  return Response.ok('add user is ok ....\n$sineub');
}

Response echoHandler(Request request) {
  final message = request.params['message'];

  return Response.ok('$message\n');
}

void main() {
  withHotreload(() => createServer());
}

Future<HttpServer> createServer() async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final pipeline = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(adduser())
      .addMiddleware((addpass()))
      .addHandler(router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(pipeline, ip, port);
  print('http://${server.address.host}:${server.port}');

  return server;
}

Middleware adduser() => (innerHandler) => (Request req) {
      final addusers = req.headers;
      if (addusers["usar"] == null) {
        return Response.unauthorized("eroore add user  plase entar new usar");
      }

      sineub?.add({"user": addusers});

      print(sineub);

      return innerHandler(req);
    };

Middleware addpass() => (innerHandler) => (Request req) {
      final addusers = req.headers;
      if (addusers["pass"] == null) {
        return Response.unauthorized("eroore add user  plase entar new pass");
      }

      sineub?.add({"pass": addusers});

      print(sineub);

      return innerHandler(req);
    };
