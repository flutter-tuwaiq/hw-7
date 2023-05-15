import 'package:shelf/shelf.dart';

Middleware checkBosse() =>(innerHandler) => (Request req){
  final header = req.headers;
if(header['user'] !='boss'){
  return Response.unauthorized('boss access denied');
}

return innerHandler(req);
};