// ignore_for_file: camel_case_types, file_names

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Midware/User Response/teacherResponse.dart';
import '../Midware/checkUserType.dart';

class teacherRoute {
  Handler get handler {
    final router = Router()
      ..post('/login', loginResponse)
      ..post('/signup', signupResponse)
      ..post('/sendpost', sendpostResponse)
      ;
    final pipline = Pipeline().addMiddleware(checkTeacher()).addHandler(router);
    
    return pipline;
  }
}

