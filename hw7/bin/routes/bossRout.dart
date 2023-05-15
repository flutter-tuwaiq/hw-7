import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../middleware/checkboss.dart';
import '../response/bossResponse/bossLogin.dart';
import '../response/bossResponse/bossSignup.dart';
import '../response/sendPost.dart';

class bossRout{
  Handler get myRouter{
  final router = Router()
..post('/login',bossLogin)
..post('/signup', bossSignup)
..post('/sendpost', sendPost);

final pipline = Pipeline().addMiddleware(checkBosse()).addHandler(router);

return pipline;
}}