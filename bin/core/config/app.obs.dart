import 'dart:async';
import 'dart:isolate';

Future<void> startObs() async {
  await Isolate.spawn(
    (message) {
      Timer.periodic(Duration(seconds: 10), isolate);
    },
    isolate,
  );
}

void isolate(Timer timer) {
  print('Isolate');
}
