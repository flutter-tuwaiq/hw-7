import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';
import 'package:shelf_router/shelf_router.dart';

import 'routes/baseroute.dart';

// Configure routes.


// Run this app with --enable-vm-service (or use debug run)
void main() async => withHotreload(() => createServer());

Future<HttpServer> createServer() async{

final ip = InternetAddress.anyIPv4;

final pipline = Pipeline().addHandler(BaseRoute().handler);

final int port = int.parse(Platform.environment["PORT"] ?? "8080");
//serv to run the server 
final server = await serve(BaseRoute().handler, ip, port);
//check if serer is turn on 
print("server is on at http://${server.address.host}:${server.port}");
return server;
 



  
}
