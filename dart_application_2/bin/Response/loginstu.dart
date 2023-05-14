import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../../server.dart';
Future<Response> loginstu(Request req) async {
  try {
        List <Map<String,dynamic>> student=[];
    final myinfo = json.decode(await req.readAsString());
    dynamic username = myinfo["username"];
    var password = myinfo["password"];
    Map<String, dynamic> stu;
    if (student.isNotEmpty) {
      stu = student.firstWhere((elem) => elem["username"] == username);
    } else {
      return Response.forbidden("Invalid username or password");
    }
    return stu["password"] == password ? Response.ok
    ("  successfully!") :
     Response.forbidden("Invalid username or password");
  } catch (e) {
    print(e);
  }
      return Response.ok("!");

}

