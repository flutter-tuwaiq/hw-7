import 'package:http/http.dart';
import 'package:shelf_router/shelf_router.dart';
import 'sudent.dart';
import 'teacher.dart';

class Main {
  Router get handler {
    final router = Router()
      ..mount("/user",student().handler)
     ..mount("/admin", teacher().handler)
      ..mount("/admin", teacher().handler);
      {
      }

    return router;
  }
}