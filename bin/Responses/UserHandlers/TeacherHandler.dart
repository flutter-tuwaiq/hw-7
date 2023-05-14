import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../../Models/Post.dart';
import '../../Models/User.dart';

List<User> teachers = [];
List<Post> posts = [];

Future<Response> TeacherSignUpHandler(Request req) async {
  final body = await req.readAsString();
  var teacher = User.fromJson(jsonDecode(body));
  teachers.add(teacher);

  return Response.ok('naw student signed up');
}

Future<Response> TeacherLoginHandler(Request req) async {
  final body = await req.readAsString();
  var queryTeacher = User.fromJson(jsonDecode(body));
  var foundTeacher =
      teachers.firstWhere((teacher) => teacher.id == queryTeacher.id);

  if (foundTeacher.userName == queryTeacher.userName &&
      foundTeacher.password == queryTeacher.password) {
    return Response.forbidden('user logged');
  } else {
    return Response.ok('password or username is wrong');
  }
}

Future<Response> TeacherPostHandeler(Request req) async {
  final body = await req.readAsString();
  var post = Post.fromJson(jsonDecode(body));
  posts.add(post);

  return Response.ok('naw post has been added');
}

Middleware checkType() => (innerHandler) => (Request req) {
      final header = req.headers;

      if (header['type'] != 'teacher') {
        return Response.unauthorized('Your not authorized');
      }

      return innerHandler(req);
    };
