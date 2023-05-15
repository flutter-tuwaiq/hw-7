// ignore_for_file: file_names

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class AuthRoute {
  Router get handler {
    final router = Router()
      ..get('/login', (Request _) {
        return Response.ok("Auth login");
      });

    return router;
  }
}
