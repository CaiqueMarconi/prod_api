import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_modular/shelf_modular.dart';

import 'modules/app_module.dart';

void main() async {
  final modularHandler = Modular(
    module: AppModule(),
    middlewares: [
      logRequests(),
    ],
  );
  final ip = InternetAddress.anyIPv4;

  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(modularHandler, ip, port);
  print('Server listening on port ${server.port}');
}
