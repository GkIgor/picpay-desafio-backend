import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../controller/users/users.controller.dart';

final router = Router()
  ..get('/', _rootHandler)
  ..get('/echo/<message>', _echoHandler)
  ..post('/users', createUser);

Response _rootHandler(Request req) {
  return Response.ok('Hello, World!\n');
}

Response _echoHandler(Request request) {
  final message = request.params['message'];
  return Response.ok('$message\n');
}
