import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../Middlewares/checkStudent.dart';
import '../Respones/Users/createPostResponse.dart';
import '../Respones/Users/loginResponse.dart';
import '../Respones/Users/signupResponse.dart';

class StudentRoute {
  Handler get handler {
    final router = Router()
      ..post('/login', loginResponse)
      ..post('/signup', signupResponse)
      ..post('/create_post', createPostResponse);

    // the student route has middleware for authorization
    final pipeline =
        Pipeline().addMiddleware(checkStudent()).addHandler(router);

    return pipeline;
  }
}
