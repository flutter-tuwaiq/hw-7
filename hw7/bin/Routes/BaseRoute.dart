import 'package:shelf_router/shelf_router.dart';

import 'boss.dart';
import 'student.dart';
import 'teacher.dart';
import '../Responses/baseRes.dart';

class BaseRoute {
  Router get handler {
    final router = Router()
      ..get('/', rootHandler)
      ..mount('/student', StudentRoute().handler)
      ..mount('/teacher', TeacherRoute().handler)
      ..mount('/boss', BossRoute().handler);

    return router;
  }
}
