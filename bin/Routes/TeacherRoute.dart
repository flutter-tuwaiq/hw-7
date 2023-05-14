import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Responses/UserHandlers/TeacherHandler.dart';


class TeacherRoute {
  Handler get handler {
    final router = Router()
    ..post('/signup', TeacherSignUpHandler)
    ..get('/login', TeacherLoginHandler)
    ..get('/post', TeacherPostHandeler);
    final pipline = Pipeline().addMiddleware(checkType()).addHandler(router);
    return pipline;
  }
}
