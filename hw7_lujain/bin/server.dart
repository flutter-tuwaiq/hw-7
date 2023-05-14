import 'dart:io';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';
import 'Routes/BaseRoute.dart';

void main() {
  withHotreload(() => createServer());
}

Future<HttpServer> createServer() async {
  final ip = 'localhost';
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(BaseRoute().handler, ip, port);

  print('Server listening on port ${server.address.host}:${server.port}');

  return server;
}