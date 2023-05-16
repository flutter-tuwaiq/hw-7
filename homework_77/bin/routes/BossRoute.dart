

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

// ignore_for_file: file_names

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../MiddleWare/checkBoss.dart';
import '../Responses/logIn.dart';
import '../Responses/post.dart';
import '../Responses/signup.dart';
class BossRoute{


  Handler get handler{

final router = Router()
..post("/login",logIn)
..post("/singup",signup )
..post("/creat",post );



 final pipeline = Pipeline().addMiddleware(checkBoss()).addHandler(router);

    return pipeline;

}

}

