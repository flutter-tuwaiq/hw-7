import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Middleware/Teacher/TeacherMiddleware.dart';
import '../Response/Teacher/TeacherLogin.dart';
import '../Response/Teacher/TeacherPost.dart';
import '../Response/Teacher/TeacherSignup.dart';

class TeacherRoute{
  Handler get handler{
  Router router = Router()
  ..post("/signup", teacherSignup)
  ..post("/login", teacherLogin)
  ..post("/post", teacherPost);

  final pipeline =
        Pipeline().addMiddleware(checkTeacher()).addHandler(router);
        
  return router;
  }

}