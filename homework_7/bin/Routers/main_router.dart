import 'package:shelf_router/shelf_router.dart';

import '../Responses/main_res.dart';
import 'boss_router.dart';
import 'student_router.dart';
import 'teacher_router.dart';

class MainRouter {
  Router get handler {
    final router = Router()
      ..get('/', rootHandler)
      ..mount('/student', StudentRouter().handler)
      ..mount('/teacher', TeacherRouter().handler)
      ..mount('/boss', BossRouter().handler);

    return router;
  }
}
