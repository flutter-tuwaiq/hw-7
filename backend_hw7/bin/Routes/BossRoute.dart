import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../Middlewares/checkBoss.dart';
import '../Respones/Users/createPostResponse.dart';
import '../Respones/Users/loginResponse.dart';
import '../Respones/Users/signupResponse.dart';

class BossRoute {
  Handler get handler {
    final router = Router()
      ..post('/login', loginResponse)
      ..post('/signup', signupResponse)
      ..post('/create_post', createPostResponse);

    // the boss route has middleware for authorization
    final pipeline = Pipeline().addMiddleware(checkBoss()).addHandler(router);

    return pipeline;
  }
}
