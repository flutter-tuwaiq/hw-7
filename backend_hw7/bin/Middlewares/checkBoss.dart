import 'package:shelf/shelf.dart';

import '../server.dart';

// the boss route has a middleware for authorization
// it applies to all endpoints of boss
Middleware checkBoss() => (innerHandler) => (Request req) {
      final header = req.headers;

      // check if user type is boss
      if (header["user_type"] != "boss") {
        return Response.unauthorized("Sorry!! your are unauthorized");
      }

      // assign boss to userType to use it in the response
      userType = "boss";

      return innerHandler(req);
    };
