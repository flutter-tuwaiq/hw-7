import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'Boss.dart';
import 'Student.dart';
import 'Teacher.dart';

class BaseRoute {
  Router get handler {
    final router = Router()
      ..mount("/student", Student().handler)
      ..mount("/teacher", Teacher().handler)
      ..mount('/boss', Boss().handler)

      ..all('/<name|.*>', (Request req) {
        return Response.notFound("NOT FOUND !");
      });

    return router;
  }
}
