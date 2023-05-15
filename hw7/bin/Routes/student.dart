import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Middlewars/studentmiddleware.dart';
import '../Responses/studentRes.dart';

class StudentRoute {
  Handler get handler {
    final router = Router()
      ..post('/login/student', loginResponse)
      ..post('/signup/student', signUpResponse)
      ..post('/send_post/student', sendPostResponse);
    final pipline = Pipeline().addMiddleware(checkStudent()).addHandler(router);
    return pipline;
  }
}
