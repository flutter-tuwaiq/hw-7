import 'package:shelf/shelf.dart';

import '../server.dart';

// the student route has a middleware for authorization
// it applies to all endpoints of student
Middleware checkStudent() => (innerHandler) => (Request req) {
      final header = req.headers;

      // check if user type is student
      if (header["user_type"] != "student") {
        return Response.unauthorized("Sorry!! your are unauthorized");
      }

      // assign student to userType to use it in the response
      userType = "student";

      return innerHandler(req);
    };
