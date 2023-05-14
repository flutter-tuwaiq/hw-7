import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';
import 'package:shelf_router/shelf_router.dart';

import 'Routes/BaseRoute.dart';

// insert all register information of all user type (studen,teacher and boss)
// when they signed up
List<Map> studentData = [];

List<Map> techerData = [];

List<Map> bossData = [];

// insert all posts when users create it
List<Map> posts = [];

var userType;

void main() {
  withHotreload(() => createServer());
}

Future<HttpServer> createServer() async {
  final ip = InternetAddress.anyIPv4;

  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  final server = await serve(BaseRoute().route, ip, port);
  print('Server listening on port ${server.address.host}:${server.port}');

  return server;
}
