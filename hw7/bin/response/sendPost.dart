import 'dart:convert';

import 'package:shelf/shelf.dart';

sendPost (Request req)async{ 
  List<Map> post = [];
  try{
  final body =await req.readAsString();
  final jsonbody= json.decode(body);
  post.add(jsonbody);
  
 return Response.ok(body);
  }catch(error){
    print(error);
  }
}