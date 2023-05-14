import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../Middlewares/teacher_mid.dart';
import '../Responses/teacher_res.dart';

class TeacherRouter {
  Handler get handler {
    final router = Router()
      ..post('/login', loginHandler)
      ..post('/signup', signinHandler)
      ..post('/send_post', sendPostHandler);

    final pipline = Pipeline().addMiddleware(checkTeacher()).addHandler(router);

    return pipline;
  }
}
