import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';
import 'package:shelf_router/shelf_router.dart';

import 'Routes/BaseRoute.dart';

/*
// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..get('/echo/<message>', _echoHandler);


Response _echoHandler(Request request) {
  final message = request.params['message'];
  return Response.ok('$message\n');
}
*/

void main() {
  withHotreload(
    () => createServer(),
    logLevel: Level.INFO,
  );
}

Future<HttpServer> createServer() async {
  // Use any available host or container IP (usually `0.0.0.0`).
  //final ip = InternetAddress.anyIPv4;
  final ip = 'localhost';
  final pipline = Pipeline().addHandler(BaseRoute().handler);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(pipline, ip, port);
  print('Server listening on port ${server.port}');

  return server;
}
