import 'dart:convert';

import 'package:shelf/shelf.dart';

teacherSignup (Request req)async{ 
  List<Map> teacher = [];
  try{
  final body =await req.readAsString();
  final jsonbody= json.decode(body);
  teacher.add(jsonbody);
  
 return Response.ok("Teacher account successfully created");
  }catch(error){
    print(error);
  }
}