
import 'package:shelf/shelf.dart';
import '../server.dart';

Middleware AuthBoss() => (innerHandler) => (Request req) {
      final header = req.headers;
      
      if (header['userType'] != 'boss') {
        return Response.unauthorized('sorry unauthorized ');
      }
      return innerHandler(req);
    };
