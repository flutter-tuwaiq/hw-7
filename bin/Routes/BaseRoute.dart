import 'package:shelf_router/shelf_router.dart';

import 'BossRoute.dart';
import 'StudentRoute.dart';
import 'TeacherRoute.dart';

class BaseRoute {
  Router get handler {
    Router router = Router()
      ..mount("/student", StudentRoute().handler)
      ..mount("/teacher", TeacherRoute().handler)
      ..mount("/boss", BossRoute().handler);

    return router;
  }
}
