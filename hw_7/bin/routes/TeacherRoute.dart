

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Middleware/checkteacher.dart';
import '../Middleware/chickauth.dart';

class TeacherRoute {
  Handler get handler {
    final router = Router()
      ..post('/login', teacherLogIn)
      ..post('/signup', teacherSignUp);
      // ..post('/post', teacherPost);

    final pipeline = Pipeline().addMiddleware(checkAuthTeacher()).addHandler(router);

    return pipeline;
  }
}