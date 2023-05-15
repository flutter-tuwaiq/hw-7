import 'dart:convert';

import 'package:shelf/shelf.dart';

bossSignup (Request req)async{ 
  List<Map> boss = [];
  try{
  final body =await req.readAsString();
  final jsonbody= json.decode(body);
  // if(jsonbody.keys.toString()!=("name", "email", "username", "password")){
  //   return Response.badRequest(body:"" );
  // }

  boss.add(jsonbody);
  
 return Response.ok("boss account successfully created");
  }catch(error){
    print(error);
  }
}