import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'BossRoute.dart';
import 'StudentRoute.dart';
import 'TeacherRoute.dart';

class BaseRoute {
  Router get handler {
    final router = Router()
      ..mount('/student', StudentRoute().router)
      ..mount('/teacher', TeacherRoute().router)
      ..mount('/boss', BossRoute().router)
      ..all('/<name|.*>', (Request req) {
        return Response.notFound("Page Not Found");
      });

    return router;
  }
}
