
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../MiddleWare/checkTeacher.dart';
import '../Responses/logIn.dart';
import '../Responses/post.dart';
import '../Responses/signup.dart';



class TeacherRoute{


  Handler get handler{

final router = Router()
..post("/login",logIn)
..post("/singup",signup )
..post("/creat",post );



final pipeline = Pipeline().addMiddleware(checkTeacher()).addHandler(router);

    return pipeline;

}



}