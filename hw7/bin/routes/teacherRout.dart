

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../middleware/checkteacher.dart';
import '../response/sendPost.dart';
import '../response/teacherResponse/teacherLogin.dart';
import '../response/teacherResponse/teacherSignup.dart';

class teacherRout{
  Handler get myRouter{
  final router = Router()
..post('/login',teacherLogin)
..post('/signup', teacherSignup)
..post('/sendpost', sendPost);

final pipline = Pipeline().addMiddleware(checkteacher()).addHandler(router);

return pipline;
}}