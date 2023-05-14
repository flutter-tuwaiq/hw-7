import 'dart:convert';
import 'package:shelf/shelf.dart';
Future<Response> bossPostt(Request req) async {
  try {
     List <Map<String,dynamic>> bossPostt=[];
    final info = json.decode(await req.readAsString());
    bossPostt.add(info);
    print(bossPostt);
    return Response.ok("Post created successfully!");
  } catch (e) {
    print(e);
  }
    return Response.ok("not post");

}