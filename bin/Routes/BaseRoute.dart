import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../Middlewares/rootHandler.dart';
import 'BossRoute.dart';
import 'StudntRoute.dart';
import 'TeacherRoute.dart';

class BaseRoute{


  Router get handler {
      final router = Router()
      ..get('/', rootHandler)
      ..mount("/boss", BossRoute().handler)
      ..mount("/student",StudentRoute().handler)
      ..mount("/teacher", TeacherRoute().handler)
      ..all('/<name|.*>', (Request req) {
        return Response.notFound("Not Found Page! please try again.");
      });
    
      return router;
  }

}