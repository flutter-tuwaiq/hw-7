import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../Middlewares/checkTeacher.dart';
import '../Respones/Users/createPostResponse.dart';
import '../Respones/Users/loginResponse.dart';
import '../Respones/Users/signupResponse.dart';

class TeacherRoute {
  Handler get handler {
    final router = Router()
      ..post('/login', loginResponse)
      ..post('/signup', signupResponse)
      ..post('/create_post', createPostResponse);

    // the teacher route has middleware for authorization
    final pipeline =
        Pipeline().addMiddleware(checkTeacher()).addHandler(router);

    return pipeline;
  }
}
