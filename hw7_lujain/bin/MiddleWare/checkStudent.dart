// ignore_for_file: file_names

import 'package:shelf/shelf.dart';

Middleware checkStudent() => (innerHandler) => (Request req) {
      try {
        final header = req.headers;

        if (header['User-Type'] != 'student') {
          return Response.unauthorized('Unauthorized! not a student');
        }

      } catch (e) {
        print(e);
      }

      return innerHandler(req);
    };
