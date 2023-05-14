import 'dart:convert';
import 'package:shelf/shelf.dart';
Future<Response> loginboss(Request req) async {
  try {
        List <Map<String,dynamic>> bossone=[];
    final myinfo = json.decode(await req.readAsString());
    var username = myinfo["username"];
    var password = myinfo["password"];
    Map<String, dynamic> exist;
    if (bossone.isNotEmpty) {
      exist = bossone.firstWhere((elem) => elem["username"] == username);
    } else {
      return Response.forbidden("Invalid username or password");
    }
    return exist["password"] == password ? Response.ok
    (" logged successfully!") :
     Response.forbidden("Invalid username or password");
  } catch (e) {
    print(e);
  }
    return Response.ok("not successfully!");

}

