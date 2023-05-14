import 'dart:convert';
import 'package:shelf/shelf.dart';

import '../../Models/Post.dart';
import '../../Models/User.dart';

List<User> bosses = [];
List<Post> posts = [];

Future<Response> BossSignUpHandler(Request req) async {
  final body = await req.readAsString();
  var boss = User.fromJson(jsonDecode(body));
  bosses.add(boss);

  return Response.ok('naw student signed up');
}

Future<Response> BossLoginHandler(Request req) async {
  final body = await req.readAsString();
  var queryBoss = User.fromJson(jsonDecode(body));
  var foundBoss =
      bosses.firstWhere((teacher) => teacher.id == queryBoss.id);

  if (foundBoss.userName == queryBoss.userName &&
      foundBoss.password == queryBoss.password) {
    return Response.forbidden('user logged');
  } else {
    return Response.ok('password or username is wrong');
  }
}

Future<Response> BossPostHandeler(Request req) async {
  final body = await req.readAsString();
  var post = Post.fromJson(jsonDecode(body));
  posts.add(post);

  return Response.ok('naw post has been added');
}

Middleware checkType() => (innerHandler) => (Request req) {
      final header = req.headers;

      if (header['type'] != 'boss') {
        return Response.unauthorized('Your not authorized');
      }

      return innerHandler(req);
    };
