import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../Response/checkTeacher.dart';
import '../Response/loginteacher.dart';
import '../Response/postteachr.dart';
import '../Response/signupteacher.dart';
class teacher {
  Handler get handler {
    final router = Router()
      ..post('/login',loginteacher )
      ..post('/signup', signUpStudent)
      ..post('/send',postteachr);
    final pipline = Pipeline().addMiddleware(checkTeacher()).addHandler(router);
    return pipline;
  }
}
