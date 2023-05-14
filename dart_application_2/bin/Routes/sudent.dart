import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../Response/Routes/checkStudent.dart';
import '../Response/loginstu.dart';
import '../Response/postboss.dart';
import '../Response/signupstu.dart';
//import '..responses/Student.dart';
class student {
  Handler get handler {
    final router = Router()
      ..post('/login',loginstu )
      ..post('/signup', siginupstud)
      ..post('/send',bossPostt);
    final pipline = Pipeline().addMiddleware(checkStudent()).addHandler(router);
    return pipline;
  }
}