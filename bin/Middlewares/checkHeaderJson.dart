import 'package:shelf/shelf.dart';

Middleware checkHeaderJson = (innerHandler) => (Request req) {
      final header = req.headers;

      print(header);

      if (!header.containsKey("Content-Type")) {
        return Response.forbidden('Add Content-Type');
      }
      if (header['Content-Type'] != 'application/json') {
        return Response.forbidden('change Content-Type to json $header');
      }

      return innerHandler(req);
    };
