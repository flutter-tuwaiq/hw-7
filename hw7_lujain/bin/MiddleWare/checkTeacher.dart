// ignore_for_file: file_names

import 'package:shelf/shelf.dart';

Middleware checkTeacher() => (innerHandler) => (Request req) {
      try {
        final header = req.headers;

        if (header['User-Type'] != 'teacher') {
          return Response.unauthorized('Unauthorized! not a teacher');
        }

      } catch (e) {
        print(e);
      }

      return innerHandler(req);
    };
