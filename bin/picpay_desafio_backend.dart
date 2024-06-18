import 'dart:async';

import 'core/config/app.config.dart';
import 'core/config/app.obs.dart';

void main(List<String> args) async {
  await Future.wait([bootstrapApp(), startObs()]);
}
