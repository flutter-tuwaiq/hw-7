import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../mainMiddleware/checkStd.dart';
import '../mainResponse/allLogin.dart';
import '../mainResponse/allsingup.dart';
import '../mainResponse/post.dart';

class StudentRoute {
  Handler get handler {
    final router = Router()
      ..post('/login', loginResponse)
      ..post('/signup', signupResponse)
      ..post('/create_post', createPostResponse);

    final pipeline =
        Pipeline().addMiddleware(checkStudent()).addHandler(router);

    return pipeline;
  }
}