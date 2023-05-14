import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Responses/UserHandlers/BossHandler.dart';


class BossRoute {
  Handler get handler {
    final router = Router()
    ..post('/signup', BossSignUpHandler)
    ..get('/login', BossLoginHandler)
    ..get('/post', BossPostHandeler);
    final pipline = Pipeline().addMiddleware(checkType()).addHandler(router);
    return pipline;
  }
}
