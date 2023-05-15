


import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Middleware/checkboos.dart';
import '../Middleware/chickauth.dart';

class BossRoute {
  Handler get handler {
    final router = Router()
    
      ..post('/login', bossLogIn)
      ..post('/signup', bossSignUp);

    final pipeline = Pipeline().addMiddleware(checkAuthBoos()).addHandler(router);

    return pipeline;
  }
}