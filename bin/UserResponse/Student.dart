import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'Repo/DataReop.dart';


var newPost = DataReop();
var newUser = DataReop();

signUpResponse(Request request) async {
  
 try {
    final newStudentDate = jsonDecode(await request.readAsString());
        newUser.addUser(newStudentDate);
    return Response.ok("Create Student Successful",
             headers: {"Content-Type": "Application/json"},);
 } catch (e) {
  return Response.badRequest();
 }
}

addPostResponse(Request request) async {
  
 try {
    final newStudentPost = jsonDecode(await request.readAsString());
        newPost.addPost(newStudentPost);
    return Response.ok("Add post Successful",
             headers: {"Content-Type": "Application/json"},);
 } catch (e) {
  return Response.badRequest();
 }
}
