import 'package:queen_slim/services/log.service.dart';

import '../config.dart';

const List<String> switchableEnvironments = ['development', 'prepub', 'release'];

void initialize() {
  Config(
    baseUrl: "http://localhost:3000",
    switchableEnvironments: switchableEnvironments,
    sentryDSN: "",
    isMock: false,
    logLevel: LogLevel.debug,
  );
}
