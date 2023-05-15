import 'package:shelf/shelf.dart';

Middleware checkStudent() => (innerHandler) => (Request req) {
      final header = req.headers;

      if (header['UserType'] != 'student') {
        return Response.unauthorized('Unauthorized!');
      }

      return innerHandler(req);
    };
