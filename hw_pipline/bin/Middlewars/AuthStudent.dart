
import 'package:shelf/shelf.dart';

import '../server.dart';

Middleware AuthStudent() => (innerHandler) => (Request req) {
      final header = req.headers;
      
      if (header['userType'] != 'student') {
        return Response.unauthorized('sorry unauthorized');
      }

      return innerHandler(req);
    };
