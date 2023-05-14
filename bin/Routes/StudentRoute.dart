import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Middleware/Student/StudentMiddleware.dart';
import '../Response/Student/StudentLogin.dart';
import '../Response/Student/StudentPost.dart';
import '../Response/Student/StudentSignup.dart';

class StudentRoute {
  Handler get handler {
    Router router = Router()
      ..post("/signup", studentSignup)
      ..post("/login", studentLogin)
      ..post("/post", studentPost);

    final pipeline =
        Pipeline().addMiddleware(checkStudent()).addHandler(router);

    return router;
  }
}
