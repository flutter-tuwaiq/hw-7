import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';
import 'package:shelf_router/shelf_router.dart';
import 'mainRouter/mainRoute.dart';
// now difine list here.
List<Map> stdList=[];
List<Map> tetList=[];
List<Map> bossList=[];
List<Map> post=[];







void main(List<String> args) async {

  withHotreload(() => createServer(),

    logLevel: Level.INFO,
 );
}
Future<HttpServer> createServer() async {

  final ip = InternetAddress.anyIPv4;
  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(mainRouter().route, ip, port);
  print('Server work on port http://${server.port}');
  return server;
}
