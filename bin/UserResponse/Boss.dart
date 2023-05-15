
import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'Repo/DataReop.dart';




var newPost = DataReop();
var newUser = DataReop();

signUpResponse(Request request) async {
  
  try {

    final newBossData = jsonDecode(await request.readAsString());
        newUser.addUser(newBossData);
    return Response.ok("Add Student Successful",
           headers: {"Content-Type": "Application/json"},);
    
  } catch (e) {
    return Response.badRequest();
  }

}

addPostResponse(Request request) async {
  
 try {
      final newBossPost = jsonDecode(await request.readAsString());
            newPost.addPost(newBossPost);
      return Response.ok("Add post Successful",
            headers: {"Content-Type": "Application/json"},);
   
 } catch (e) {
   return Response.badRequest();
 }
}


  
    