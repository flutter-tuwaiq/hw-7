import 'package:shelf_router/shelf_router.dart';

import 'checkServer.dart';
import 'Users/Student.dart';
import 'Users/Teacher.dart';
import 'Users/Boss.dart';

class BaseRoute {
  Router get handler {
    final router = Router()
      ..get('/', checkServer)
      ..mount('/student', Student().handler)
      ..mount('/teacher', Teacher().handler)
      ..mount('/boss', Boss().handler);

    return router;
  }
}
