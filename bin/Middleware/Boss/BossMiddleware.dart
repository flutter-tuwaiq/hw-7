import 'package:shelf/shelf.dart';

Middleware checkBoss() => (innerHandler) => (Request req) {
      final header = req.headers;

      if (header['User-Type'] != 'boss') {
        return Response.unauthorized('Unauthorized!');
      }

      return innerHandler(req);
    };
