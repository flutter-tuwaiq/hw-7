import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:shelf/shelf.dart';

import '../server.dart';

signupResponse(Request req) async {
  final Map userssingu = jsonDecode(await req.readAsString());

  Function equal = const ListEquality().equals;
  List signupKeys = userssingu.keys.toList();
  List keysList = ["name", "email", "username", "password"];
  
  if (!equal(signupKeys, keysList)) {
    return Response.forbidden(
      "Please enter all information!",
    );
  }

  var typeU;
   var studentData;
   var techerData;
    var bossData;
  if (typeU == "student") {
    studentData.add(userssingu);
  }
  if (typeU == "teacher") {
    techerData.add(userssingu);
  }
  if (typeU == "boss") {
    bossData.add(userssingu);
  }

  return Response.ok(
    "You have been signed up successfully \n$userssingu",
    headers: {"Content-Type": "Application/json"},
  );
}