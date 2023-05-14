import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../Responses/base/echoHandler.dart';
import '../Responses/base/rootHandler.dart';
import 'BossRoute.dart';
import 'StudentRoute.dart';
import 'TeacherRoute.dart';



class BaseRoute {
  Router get handler {
    final router = Router()
      ..get('/', rootHandler)
      ..get('/echo/<message>', echoHandler)
      ..mount("/student", StudentRoute().handler)
      ..mount("/teacher", TeacherRoute().handler)
      ..mount('/boss', BossRoute().handler)
      ..all('/<name|.*>', (Request req) {
        return Response.forbidden("you are try access page name ${req.url}");
      });

    return router;
  }
}
