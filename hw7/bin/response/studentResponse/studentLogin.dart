import 'package:shelf/shelf.dart';

studentLogin (Request _)async{ 
  try{

 return Response.ok("login student");
  }catch(error){
    print(error);
  }
}