import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';
import 'package:shelf_router/shelf_router.dart';

import 'Routes/BaseRoute.dart';

List<Map<String,dynamic>> students = [];
List<Map<String,dynamic>> studentsPost = [];

List<Map<String,dynamic>> teachers = [];
List<Map<String,dynamic>> teachersPost = [];

List<Map<String,dynamic>> bosses = [];
List<Map<String,dynamic>> bossesPost = [];


void main(){
  withHotreload(() => createServer());

  
}

Future<HttpServer> createServer() async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(BaseRoute().handler);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server listening on port http://${server.address.host}:${server.port}');

  return server;

}
