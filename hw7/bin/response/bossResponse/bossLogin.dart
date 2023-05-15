import 'dart:convert';

import 'package:shelf/shelf.dart';


bossLogin (Request _)async{ 

  try{


 return Response.ok("login boss");
  }catch(error){
    print(error);
  }
}