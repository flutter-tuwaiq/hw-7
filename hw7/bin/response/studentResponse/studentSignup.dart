import 'dart:convert';

import 'package:shelf/shelf.dart';

studentSignup (Request req)async{ 
  List<Map> student = [];
  try{
  final body =await req.readAsString();
  final jsonbody= json.decode(body);
  student.add(jsonbody);
  
 return Response.ok("Student account successfully created");
  }catch(error){
    print(error);
  }
}