import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';

// Configure routes
// .
int s = 0;

Map? sineub = {};
Map? tetshsine = {};

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
  final pipelineaddstudint = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(adduser())
      .addMiddleware((addpass()))
      .addHandler(router);
  final pipelinesininstudet = Pipeline()
      .addMiddleware(csekusertudint())
      .addMiddleware(csekpassstudint());
  final pipeline = Pipeline();

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(router, ip, port);
  print('http://${server.address.host}:${server.port}');

  return server;
}

Middleware adduser() => (innerHandler) => (Request req) {
      final addusers = req.headers;
      if (addusers["usar"] == null) {
        return Response.unauthorized("eroore add user  plase entar new usar");
      }

      sineub?["usar"] = addusers;

      print(sineub);

      return innerHandler(req);
    };

Middleware addpass() => (innerHandler) => (Request req) {
      final adduserspass = req.headers;
      if (adduserspass["pass"] == null) {
        return Response.unauthorized("eroore add user  plase entar new pass");
      }

      sineub?["pass"] = adduserspass;

      print(sineub);

      return innerHandler(req);
    };
Middleware addpasstesh() => (innerHandler) => (Request req) {
      final addusers = req.headers;
      if (addusers["pass"] == null) {
        return Response.unauthorized("eroore add user  plase entar new pass");
      }

      tetshsine?["passtetsh"] = addusers;

      print(sineub);

      return innerHandler(req);
    };
Middleware addusertetsh() => (innerHandler) => (Request req) {
      final addusers = req.headers;
      if (addusers["user"] == null) {
        return Response.unauthorized("eroore add user  plase entar new pass");
      }

      tetshsine?["usertetsh"] = addusers;

      print(sineub);

      return innerHandler(req);
    };
Middleware csekpassstudint() => (innerHandler) => (Request req) {
      final addusers = req.headers;
      if (addusers["pass"] != sineub?["pass"]) {
        return Response.unauthorized("eroore add user  plase entar new pass");
      }

      return innerHandler(req);
    };
Middleware csekusertudint() => (innerHandler) => (Request req) {
      final addusers = req.headers;
      if (addusers["user"] != sineub?["user"]) {
        return Response.unauthorized("eroore add user  plase entar new pass");
      }

      return innerHandler(req);
    };
Middleware csekpasstetsh() => (innerHandler) => (Request req) {
      final addusers = req.headers;
      if (addusers["pass"] != sineub?["passtetsh"]) {
        return Response.unauthorized("eroore add user  plase entar new pass");
      }

      return innerHandler(req);
    };

Middleware csekusertetsh() => (innerHandler) => (Request req) {
      final addusers = req.headers;
      if (addusers["user"] != sineub?["usertetsh"]) {
        return Response.unauthorized("eroore add user  plase entar new pass");
      }

      return innerHandler(req);
    };
