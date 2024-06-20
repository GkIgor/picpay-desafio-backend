import 'dart:async';
import 'package:dotenv/dotenv.dart';
import 'core/config/app.config.dart';
import 'core/config/app.obs.dart';

void main(List<String> args) async {
  DotEnv().load();

  await Future.wait([bootstrapApp(), startObs()]);
}
