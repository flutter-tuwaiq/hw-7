
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../Middlewares/CheckUsers.dart';
import '../UserResponse/Repo/Login.dart';
import '../UserResponse/Boss.dart';


class BossRoute{

  Handler get handler{
    final router = Router()
    ..post('/login', loginResponse)
    ..post('/signup', signUpResponse)
    ..post('/addPost', loginResponse);

    final pipline = Pipeline().addMiddleware(CheckUsers().checkBoss()).addHandler(router);

    return pipline;
  }


  
}