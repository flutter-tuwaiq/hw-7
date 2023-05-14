import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Middlewares/boss_mid.dart';
import '../Responses/boss_res.dart';

class BossRouter {
  Handler get handler {
    final router = Router()
      ..post('/login', loginHandler)
      ..post('/signup', signinHandler)
      ..post('/send_post', sendPostHandler);

    final pipline = Pipeline().addMiddleware(checkBoss()).addHandler(router);

    return pipline;
  }
}
