import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../middleware/checkstudent.dart';
import '../response/sendPost.dart';
import '../response/studentResponse/studentLogin.dart';
import '../response/studentResponse/studentSignup.dart';

class studentRout{
  Handler get myRouter{
  final router = Router()
..post('/login',studentLogin)
..post('/signup', studentSignup)
..post('/sendpost', sendPost);

final pipline = Pipeline().addMiddleware(checkStudent()).addHandler(router);

return pipline;
}}