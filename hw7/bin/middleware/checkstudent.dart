import 'package:shelf/shelf.dart';

Middleware checkStudent() =>(innerHandler) => (Request req){
  final header = req.headers;
if(header['user'] !='student'){
  return Response.unauthorized('student access denied');
}

return innerHandler(req);
};