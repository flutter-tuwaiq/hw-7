import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'Repo/DataReop.dart';



var newPost = DataReop();
var newUser = DataReop();

signUpResponse(Request request) async {
  
  try {
        final newTeacherDate = jsonDecode(await request.readAsString());
              newUser.addUser(newTeacherDate);
        return Response.ok("Add Teacher Successful",
                  headers: {"Content-Type": "Application/json"},);

  } catch (e) {
    Response.badRequest();
  }
}


addPostResponse(Request request) async {
  
  try {

    final newTeacherPost = jsonDecode(await request.readAsString());
        newPost.addPost(newTeacherPost);
    return Response.ok("Add post Successful",
             headers: {"Content-Type": "Application/json"},);
    
  } catch (e) {
   return Response.badRequest();
  }
}
