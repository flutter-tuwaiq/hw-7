// ignore_for_file: file_names

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../MiddleWare/checkStudent.dart';
import '../Responses/logInHandler.dart';
import '../Responses/postHandler.dart';
import '../Responses/signUpHandler.dart';

class StudentRoute {
  Handler get handler {
    final router = Router()
      ..post('/login', logInHandler)
      ..post('/signup', signUpHandler)
      ..post('/create_post', postHandler);

    // the boss route has middleware for authorization
    final pipeline = Pipeline().addMiddleware(checkStudent()).addHandler(router);

    return pipeline;
  }
}