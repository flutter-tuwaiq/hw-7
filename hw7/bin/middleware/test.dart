import 'package:shelf/shelf.dart';

Middleware checkName() =>(innerHandler) => (Request req){
  final header = req.headers;
// if(header['name'] !='boss'){
//   return Response.unauthorized('w');
// }

return innerHandler(req);
};