// ignore_for_file: file_names

import 'package:shelf/shelf.dart';

Middleware checkBoss() => (innerHandler) => (Request req) {
      try {
        final header = req.headers;

        if (header['User-Type'] != 'boss') {
          return Response.unauthorized('Unauthorized! not a boss');
        }

      } catch (e) {
        print(e);
      }

      return innerHandler(req);
    };
