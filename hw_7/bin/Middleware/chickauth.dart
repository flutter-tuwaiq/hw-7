

import 'package:shelf/shelf.dart';

Middleware checkAuthTeacher() => (innerHandler) => (Request req) {
      final header = req.headers;

      if (header['User-Type'] != 'Teacher') {
        return Response.unauthorized('you are not authorized');
      }

      return innerHandler(req);
    };

Middleware checkAuthStudents() => (innerHandler) => (Request req) {
      final header = req.headers;

      if (header['User-Type'] != 'Students') {
        return Response.unauthorized('you are not authorized');
      }

      return innerHandler(req);
    };

Middleware checkAuthBoos() => (innerHandler) => (Request req) {
      final header = req.headers;

      if (header['User-Type'] != 'Boos') {
        return Response.unauthorized('you are not authorized');
      }

      return innerHandler(req);
    };