import 'package:shelf/shelf.dart';

import '../server.dart';

Middleware checkBoss() => (innerHandler) => (Request req) {
      final header = req.headers;

      if (header["user_type"] != "boss") {
        return Response.unauthorized("Sorry!! your are unauthorized");
      }

      return innerHandler(req);
    };