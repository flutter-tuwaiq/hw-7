import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../Middlewares/CheckUsers.dart';
import '../UserResponse/Repo/Login.dart';
import '../UserResponse/Boss.dart';


class StudentRoute{

  Handler get handler{
    final router = Router()
    ..post('/login', loginResponse)
    ..post('/sinup', signUpResponse)
    ..post('/addPost', loginResponse);

    final pipline = Pipeline().addMiddleware(CheckUsers().checkStudent()).addHandler(router);

    return pipline;
  }

}