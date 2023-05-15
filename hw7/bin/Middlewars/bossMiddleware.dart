import 'package:shelf/shelf.dart';

Middleware checkBoss() => (innerHandler) => (Request req) {
      final header = req.headers;

      if (header['UserType'] != 'boss') {
        return Response.unauthorized('Unauthorized!');
      }

      return innerHandler(req);
    };
