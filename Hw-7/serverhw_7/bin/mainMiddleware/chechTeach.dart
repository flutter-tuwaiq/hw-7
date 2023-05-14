import 'package:shelf/shelf.dart';

import '../server.dart';

Middleware checkTeacher() => (innerHandler) => (Request req) {
      final header = req.headers;
      if (header["user_type"] != "teacher") {
        return Response.unauthorized("Sorry!! your are unauthorized");
      }

      return innerHandler(req);
    };