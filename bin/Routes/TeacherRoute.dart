import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../Middlewares/CheckUsers.dart';
import '../UserResponse/Repo/Login.dart';
import '../UserResponse/Boss.dart';


class TeacherRoute{

  Handler get handler{
    final router = Router()
    ..post('/login', loginResponse)
    ..post('/sinup', signUpResponse)
    ..post('/addPost', loginResponse);

    final pipline = Pipeline().addMiddleware(CheckUsers().checkTeacher()).addHandler(router);

    return pipline;
  }


}