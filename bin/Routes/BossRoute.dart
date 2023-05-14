import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Middleware/Boss/BossMiddleware.dart';
import '../Response/Boss/BossLogin.dart';
import '../Response/Boss/BossPost.dart';
import '../Response/Boss/BossSignup.dart';

class BossRoute {
  Handler get handler {
    Router router = Router()
      ..post("/signup", bossSignup)
      ..post("/login", bossLogin)
      ..post("/post", bossPost);

    final pipeline = Pipeline().addMiddleware(checkBoss()).addHandler(router);

    return router;
  }
}
