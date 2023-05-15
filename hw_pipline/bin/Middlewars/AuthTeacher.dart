

import 'package:shelf/shelf.dart';

import '../server.dart';

Middleware AuthTeacher() => (innerHandler) => (Request req) {
      final header = req.headers;
      
      if (header['userType'] != 'teacher') {
        return Response.unauthorized('sorry unauthorized');
      }
      
      return innerHandler(req);
    };
