// ignore_for_file: file_names

import 'package:shelf/shelf.dart';

// checkStudent Midware: check if the user is a student
Middleware checkStudent() => (innerHandler) => (Request req) {
      final header = req.headers;

      if (header['user-Type'] != 'student') {
        return Response.unauthorized('Unauthrized access attempt at student');
      }

      return innerHandler(req);
    };

// checkTeacher Midware: check if the user is a teacher
Middleware checkTeacher() => (innerHandler) => (Request req) {
      final header = req.headers;

      if (header['user-Type'] != 'teacher') {
        return Response.unauthorized('Unauthrized access attempt at teacher');
      }

      return innerHandler(req);
    };

// checkBoss Midware: check if the user is a boss
Middleware checkBoss() => (innerHandler) => (Request req) {
      final header = req.headers;

      if (header['user-Type'] != 'boss') {
        return Response.unauthorized('Unauthrized access attempt at boss');
      }

      return innerHandler(req);
    };
