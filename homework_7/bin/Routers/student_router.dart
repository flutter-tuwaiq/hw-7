import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../Middlewares/student_mid.dart';
import '../Responses/student_res.dart';

class StudentRouter {
  Handler get handler {
    final router = Router()
      ..post('/login', loginHandler)
      ..post('/signup', signinHandler)
      ..post('/send_post', sendPostHandler);

    final pipline = Pipeline().addMiddleware(checkStudent()).addHandler(router);

    return pipline;
  }
}
