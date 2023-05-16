import 'package:shelf/shelf.dart';

Middleware checkTeacher() => (innerHandler) => (Request req) {
      final header = req.headers;

      if (header['UserType'] != 'teacher') {
        Response.unauthorized("unauthorized");
      }

      return innerHandler(req);
    };
