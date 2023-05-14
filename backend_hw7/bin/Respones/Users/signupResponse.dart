import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:shelf/shelf.dart';

import '../../server.dart';

signupResponse(Request req) async {
  final Map userSignup = jsonDecode(await req.readAsString());

  // if user enter all data (name, email, user and password)
  Function equal = const ListEquality().equals;
  List signupKeys = userSignup.keys.toList();
  List keysList = ["name", "email", "username", "password"];
  // compare
  if (!equal(signupKeys, keysList)) {
    return Response.forbidden(
      "Please enter all information!",
    );
  }

  // check of user type and add its data to the appropriate list
  if (userType == "student") {
    studentData.add(userSignup);
  }
  if (userType == "teacher") {
    techerData.add(userSignup);
  }
  if (userType == "boss") {
    bossData.add(userSignup);
  }

  return Response.ok(
    "You have been signed up successfully \n$userSignup",
    headers: {"Content-Type": "Application/json"},
  );
}
