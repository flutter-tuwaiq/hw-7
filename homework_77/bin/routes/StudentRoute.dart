import 'dart:ffi';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../MiddleWare/checkStudent.dart';
import '../Responses/logIn.dart';
import '../Responses/post.dart';
import '../Responses/signup.dart';



class StudentRoute{


 Handler get handler{

final router = Router()
..post("/login",logIn)
..post("/singup",signup)
..post("/creat",post);


final pipeline = Pipeline().addMiddleware(checkStudent()).addHandler(router);

    return pipeline;

}


}