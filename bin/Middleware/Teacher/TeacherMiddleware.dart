
import 'package:shelf/shelf.dart';

Middleware checkTeacher() => (innerHandler) => (Request req) {
      final header = req.headers;

      if (header['User-Type'] != 'teacher') {
        return Response.unauthorized('Unauthorized!');
      }

      return innerHandler(req);
    };