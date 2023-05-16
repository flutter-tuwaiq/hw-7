import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';
import 'Middleware/checkBoss.dart';
import 'Middleware/checkStudent.dart';
import 'Middleware/checkTeacher.dart';
import 'Routers/BaseRoute.dart';

void main() {
  withHotreload(() => createServer());
}

Future<HttpServer> createServer() async {
  final ip = InternetAddress.anyIPv4;
  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(checkBoss())
      .addMiddleware(checkStudent())
      .addMiddleware(checkTeacher())
      .addHandler(BaseRoute().handler);

  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print(
    'Server listening on port http://${server.address.host}:${server.port}',
  );

  return server;
}
