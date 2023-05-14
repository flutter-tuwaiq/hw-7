import 'package:shelf/shelf.dart';

Middleware checkStudent() => (innerHandler) => (Request req) {
      final header = req.headers;
      if (header['User-Type'] != 'student') {
        return Response.unauthorized('Unauthorized!');
      }
      return innerHandler(req);
    };