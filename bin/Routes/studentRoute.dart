// ignore_for_file: file_names, camel_case_types

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Midware/User Response/studentResponse.dart';
import '../Midware/checkUserType.dart';

class studentRoute {
  Handler get handler {
    final router = Router()
      ..post('/login', loginResponse)
      ..post('/signup', signupResponse)
      ..post('/sendpost', sendpostResponse)
      ;
    final pipline = Pipeline().addMiddleware(checkStudent()).addHandler(router);

    return pipline;
  }
}
