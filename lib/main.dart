import 'dart:async';

import 'package:get/get.dart';
import 'package:queen_slim/app.dart';
import 'package:queen_slim/services/index.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(
    () async {
      queenApp();
    },
    (Object error, StackTrace stack) {
      // 后续替换为sentry
      try {
        final LogService logService = Get.find<LogService>();
        logService.e(error, error, stack);
      } finally {
        // ignore: avoid_print
        print('runZonedGuarded');
      }
    },
  );
}
