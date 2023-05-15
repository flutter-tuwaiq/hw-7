


import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Middleware/checkstudents.dart';
import '../Middleware/chickauth.dart';

class StudentRoute {
  Handler get handler {
    final router = Router()

      ..post('/login', studentLogIn)
      ..post('/signup', studentSignUp);

    final pipeline = Pipeline().addMiddleware(checkAuthStudents()).addHandler(router);

    return pipeline;
  }
}