import 'package:shelf/shelf.dart';

import '../server.dart';

// the teacher route has a middleware for authorization
// it applies to all endpoints of teacher
Middleware checkTeacher() => (innerHandler) => (Request req) {
      final header = req.headers;

      // check if user type is teacher
      if (header["user_type"] != "teacher") {
        return Response.unauthorized("Sorry!! your are unauthorized");
      }

      // assign teacher to userType to use it in the response
      userType = "teacher";

      return innerHandler(req);
    };
