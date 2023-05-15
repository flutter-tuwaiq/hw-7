

import 'package:shelf/shelf.dart';

Middleware teacherLogIn() => (innerHandler) => (Request req) {
      final header = req.headers;

      if (header['username'] == null) {
        return Response.unauthorized('sorry ,Please enter your Username');
      }
      if (header['password'] == null) {
        return Response.unauthorized('sorry ,Please enter your Password');
      }

      return innerHandler(req);
    };


Middleware teacherSignUp() => (innerHandler) => (Request req) {
      final header = req.headers;

      if (header['name'] == null) {
        return Response.unauthorized('sorry , Please enter your Name');
      }
      if (header['email'] == null) {
        return Response.unauthorized('sorry ,Please enter your Email');
      }
      if (header['username'] == null) {
        return Response.unauthorized('sorry ,Please enter your Username');
      }
      if (header['password'] == null) {
        return Response.unauthorized('sorry ,Please enter your Password');
      }

      return innerHandler(req);
    };