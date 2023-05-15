// ignore_for_file: file_names
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Responses/Base/echoHandler.dart';
import '../Responses/Base/rootHandler.dart';

import 'AuthRoute.dart';
import 'studentRoute.dart';
import 'teacherRoute.dart';
import 'bossRoute.dart';

class BaseRoute {
  Router get handler {
    final router = Router()
      ..get('/', rootHandler)
      ..get('/echo/<message>', echoHandler)
      ..mount("/student", studentRoute().handler)
      ..mount("/teacher", teacherRoute().handler)
      ..mount("/boss", bossRoute().handler)
      ..mount('/auth', AuthRoute().handler)
      ..all('/<name|.*>', (Request req) {
        return Response.forbidden("you are try access page name ${req.url}");
      });

    return router;
  }
}
