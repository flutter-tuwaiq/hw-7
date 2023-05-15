

import 'dart:ffi';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'package:shelf_router/shelf_router.dart';

import 'BossRoute.dart';
import 'StudentRoute.dart';
import 'TeacherRoute.dart';


class MainRoute {
  Router get handler {
    final router = Router()
      ..mount('/student', StudentRoute().handler)
      ..mount('/teacher', TeacherRoute().handler)
      ..mount('/boss', BossRoute().handler);

    return router;
  }
}