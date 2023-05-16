import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'BossRoute.dart';
import 'StudentRoute.dart';
import 'Teacher.dart';

class BaseRoute {
  Router get handler {
    final router = Router()
      ..mount('/student',StudentRoute().handler)
      ..mount('/teacher',TeacherRoute().handler)
      ..mount('/boss', BossRoute().handler)
      ..all('/<name|.*>', (Request req) {
        return Response.notFound("Not Found Page!");
      });

    return router;
  }
}

