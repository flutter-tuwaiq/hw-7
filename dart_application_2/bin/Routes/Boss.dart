import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../Response/checkBoss.dart';
import '../Response/loginboss.dart';
import '../Response/postboss.dart';
import '../Response/signupost.dart';

class Boos {
  Handler get handler {
    final router = Router()
      ..post('/login',loginboss )
      ..post('/signup', signupost)
      ..post('/send',bossPostt);
    final pipline = Pipeline().addMiddleware(checkBoss()).addHandler(router);
    return pipline;
  }
}