import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Middlewars/teacherMiddleware.dart';
import '../Responses/teacherRes.dart';

class TeacherRoute {
  Handler get handler {
    final router = Router()
      ..post('/login', loginResponse)
      ..post('/signup', signUpResponse)
      ..post('/send_post', sendPostResponse);
    final pipline = Pipeline().addMiddleware(checkTeacher()).addHandler(router);
    return pipline;
  }
}
