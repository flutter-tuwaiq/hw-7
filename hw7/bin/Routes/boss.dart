import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Middlewars/bossMiddleware.dart';
import '../Responses/bossRes.dart';

class BossRoute {
  Handler get handler {
    Router router = Router()
      ..post("/signup", loginResponse)
      ..post("/login", loginResponse)
      ..post("/post", sendPostResponse);

    final pipeline = Pipeline().addMiddleware(checkBoss()).addHandler(router);

    return router;
  }
}
