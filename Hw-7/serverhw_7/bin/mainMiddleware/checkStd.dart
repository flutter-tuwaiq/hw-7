import 'package:shelf/shelf.dart';

import '../server.dart';

Middleware checkStudent() => (innerHandler) => (Request req) {
      final header = req.headers;

      if (header["user_type"] != "student") {
        return Response.unauthorized("Sorry!! your are unauthorized");
      }

      

      return innerHandler(req);
    };