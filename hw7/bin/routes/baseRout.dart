import 'package:shelf_router/shelf_router.dart';

import 'bossRout.dart';
import 'studentRout.dart';
import 'teacherRout.dart';






class baseRout{
  Router get myRouter{
  final router = Router()
// ..get('/',displayinfo)
// ..post('/post',postcode)
// ..get('/echo<message>',echoh)
// ..get('/info',displayData)
..mount(("/boss"), bossRout().myRouter)
..mount(("/student"), studentRout().myRouter)
..mount(("/teacher"), teacherRout().myRouter); 

return router;
}}
