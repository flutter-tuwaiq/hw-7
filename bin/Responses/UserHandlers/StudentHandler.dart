import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../../Models/Post.dart';
import '../../Models/User.dart';

List<User> students = [];
List<Post> posts = [];

Future<Response> StudentSignUpHandler(Request req) async {
  final body = await req.readAsString();
  var student = User.fromJson(jsonDecode(body));
  students.add(student);

  return Response.ok('naw student signed up');
}

Future<Response> StudentLoginHandler(Request req) async {
  final body = await req.readAsString();
  var queryStudent = User.fromJson(jsonDecode(body));
  var foundStudent =
      students.firstWhere((student) => student.id == queryStudent.id);

  if (foundStudent.userName == queryStudent.userName &&
      foundStudent.password == queryStudent.password) {
    return Response.forbidden('user logged');
  } else {
    return Response.ok('password or username is wrong');
  }
}

Future<Response> StudentPostHandeler(Request req) async {
  final body = await req.readAsString();
  var post = Post.fromJson(jsonDecode(body));
  posts.add(post);

  return Response.ok('naw post has been added');
}

Middleware checkType() => (innerHandler) => (Request req) {
      final header = req.headers;

      if (header['type'] != 'student') {
        return Response.unauthorized('Your not authorized');
      }

      return innerHandler(req);
    };
