import 'package:shelf/shelf.dart';

Middleware checkteacher() =>(innerHandler) => (Request req){
  final header = req.headers;
if(header['user'] !='teacher'){
  return Response.unauthorized('teacher access denied');
}

return innerHandler(req);
};