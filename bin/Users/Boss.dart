import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////// Middleware //////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

Middleware checkAuth() => (innerHandler) => (Request req) {
      final header = req.headers;

      if (header['User-Type'] != 'Boss') {
        return Response.unauthorized('Sorry you are not authorized');
      }

      return innerHandler(req);
    };

////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////// Route /////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

class Boss {
  Handler get handler {
    final router = Router()
      ..post('/login', bossLogIn)
      ..post('/signup', bossSignUp);
    // ..post('/post', bossPost);

    final pipeline = Pipeline().addMiddleware(checkAuth()).addHandler(router);

    return pipeline;
  }
}

////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////// Response ///////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////// Log in ////////////////////////////////////

Middleware bossLogIn() => (innerHandler) => (Request req) {
      final header = req.headers;

      if (header['Username'] == null) {
        return Response.unauthorized('Please enter your Username');
      }
      if (header['Password'] == null) {
        return Response.unauthorized('Please enter your Password');
      }

      return innerHandler(req);
    };

/////////////////////////////////// Sign Up ////////////////////////////////////

Middleware bossSignUp() => (innerHandler) => (Request req) {
      final header = req.headers;

      if (header['Name'] == null) {
        return Response.unauthorized('Please enter your Name');
      }
      if (header['Email'] == null) {
        return Response.unauthorized('Please enter your Email');
      }
      if (header['Username'] == null) {
        return Response.unauthorized('Please enter your Username');
      }
      if (header['Password'] == null) {
        return Response.unauthorized('Please enter your Password');
      }

      return innerHandler(req);
    };

////////////////////////////////// Send Post ///////////////////////////////////
