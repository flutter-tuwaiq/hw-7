import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Middlewars/AuthStudent.dart';
import '../Responses/student/S_CreatePost.dart';
import '../Responses/student/S_loginResponse.dart';
import '../Responses/student/S_signUpResponse.dart';

/*
Login (POST): Allow students to log in with their username and password.
Sign up (POST): Allow new students to create an account by submitting their name, email, username, and password.
Send post (POST): Allow students to create a new post by submitting a title and content.
*/

class Student {
Handler get handler {
 final router = Router()

  ..post('/login', S_loginResponse)
  ..post('/signup', S_signUpResponse)
  ..post('/create' , S_CreatePost );

final pipline = Pipeline().addMiddleware(AuthStudent()).addHandler(router);

 return pipline;

}
}

 
