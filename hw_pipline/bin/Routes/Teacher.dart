import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Middlewars/AuthTeacher.dart';
import '../Responses/teacher/T_CreatePost.dart';
import '../Responses/teacher/T_loginResponse.dart';
import '../Responses/teacher/T_signUpResponse.dart';

/*
Login (POST): Allow teachers to log in with their username and password.
Sign up (POST): Allow new teachers to create an account by submitting their name, email, username, and password.
Send post (POST): Allow teachers to create a new post by submitting a title and content.
*/

class Teacher {
  Handler get handler {
    final router = Router()
      ..post('/login', T_loginResponse)
      ..post('/signup', T_signUpResponse)
      ..post('/create', T_CreatePost);

    final pipline = Pipeline().addMiddleware(AuthTeacher()).addHandler(router);

    return pipline;
  }
}
