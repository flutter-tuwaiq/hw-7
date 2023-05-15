import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Middlewars/AuthBoss.dart';

import '../Responses/boss/B_CreatePost.dart';
import '../Responses/boss/B_loginResponse.dart';
import '../Responses/boss/B_signUpResponse.dart';


/*
Login (POST): Allow bosses to log in with their username and password.
Sign up (POST): Allow new bosses to create an account by submitting their name, email, username, and password.
Send post (POST): Allow bosses to create a new post by submitting a title and content.
*/

class Boss {
  
Handler get handler {
 final router = Router()

  ..post('/login', B_loginResponse)
  ..post('/signup', B_signUpResponse)
  ..post('/create' , B_CreatePost);

final pipline = Pipeline().addMiddleware(AuthBoss()).addHandler(router);

 return pipline;

}

}

