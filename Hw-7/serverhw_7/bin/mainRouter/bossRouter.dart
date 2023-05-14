import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../mainMiddleware/checkBoos.dart';
import '../mainResponse/allLogin.dart';
import '../mainResponse/allsingup.dart';
import '../mainResponse/post.dart';
class BossRoute {
  Handler get handler {
    final router = Router()
      ..post('/login', loginResponse)
      ..post('/signup', signupResponse)
      ..post('/create_post', createPostResponse);
    final pipeline = Pipeline().addMiddleware(checkBoss()).addHandler(router);

    return pipeline;
  }
}