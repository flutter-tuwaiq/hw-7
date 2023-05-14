import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../../server.dart';
Future<Response> bossPostt(Request req) async {
  try {
     List <Map<String,dynamic>> bossPostt=[];
    final data = json.decode(await req.readAsString());
    bossPostt.add(data);
    print(bossPostt);
    return Response.ok("Post created successfully!");
  } catch (e) {
    print(e);
  }
      return Response.ok("not successfully!");

}