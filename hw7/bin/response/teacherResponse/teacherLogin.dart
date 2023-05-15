import 'package:shelf/shelf.dart';

teacherLogin (Request _)async{ 
  try{

 return Response.ok("login teacher");
  }catch(error){
    print(error);
  }
}