import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Responses/UserHandlers/StudentHandler.dart';


class StudentRoute {
  Handler get handler {
    final router = Router()
    ..post('/signup', StudentSignUpHandler)
    ..get('/login', StudentLoginHandler)
    ..get('/post', StudentPostHandeler);
    final pipline = Pipeline().addMiddleware(checkType()).addHandler(router);
    return pipline;
  }
}
