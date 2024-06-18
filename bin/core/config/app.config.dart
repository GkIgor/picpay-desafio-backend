import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';

import 'app.router.dart';

Future<void> bootstrapApp() async {
  final ip = InternetAddress.anyIPv4;

  final pipeline = Pipeline().addMiddleware(logRequests());

  final handler = pipeline.addHandler(router.call);

  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);

  print('Server listening on port ${server.port}');
}
