import 'package:shelf_router/shelf_router.dart';

import '../Responses/creatPostResponse.dart';
import '../Responses/loginResponse.dart';
import '../Responses/signUpResponse.dart';

class StudentRoute {
  Router get router {
    final router = Router()
      ..get('/login', loginResponse)
      ..get('/signUp', signUpResponse)
      ..get('/creat_post', creatPostResponse);

    return router;
  }
}
