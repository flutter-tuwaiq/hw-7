
import 'package:shelf/shelf.dart';


class CheckUsers {

    Middleware checkBoss() => (innerHandler) => (Request req) {
        final header = req.headers;
        
        if (header['User-Type'] != 'boss') {
          return Response.unauthorized('unauthorized');
        }
        return innerHandler(req);
      };

    Middleware checkTeacher() => (innerHandler) => (Request req) {
      final header = req.headers;
      
      if (header['User-Type'] != 'teacher') {
        return Response.unauthorized('unauthorized');
      }
      return innerHandler(req);
    };


    
    Middleware checkStudent() => (innerHandler) => (Request req) {
        final header = req.headers;
        
        if (header['User-Type'] != 'student') {
          return Response.unauthorized('unauthorized');
        }
        return innerHandler(req);
      };

}




