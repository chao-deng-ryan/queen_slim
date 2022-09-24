import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queen_slim/enums/index.dart';
import 'package:queen_slim/services/index.dart';

import 'package:queen_slim/environment/development.dart' as development;
import 'package:queen_slim/environment/prepub.dart' as prepub;
import 'package:queen_slim/environment/release.dart' as release;
import 'package:queen_slim/environment/test.dart' as test;

class Config {
  final String baseUrl;
  final List<String> switchableEnvironments;
  final String? sentryDSN;
  final bool isMock;
  final LogLevel logLevel;

  static late Config _instance;

  factory Config({
    required String baseUrl,
    required List<String> switchableEnvironments,
    String? sentryDSN,
    required bool isMock,
    required LogLevel logLevel,
  }) {
    return _instance = Config._internal(
      baseUrl,
      switchableEnvironments,
      sentryDSN,
      isMock,
      logLevel,
    );
  }

  Config._internal(
    this.baseUrl,
    this.switchableEnvironments,
    this.sentryDSN,
    this.isMock,
    this.logLevel,
  );

  static Config get instance {
    return _instance;
  }

  static Future<void> initialize(Environment environment) async {
    switch (environment) {
      case Environment.test:
        test.initialize();
        break;
      case Environment.prepub:
        prepub.initialize();
        break;
      case Environment.release:
        release.initialize();
        break;
      default:
        development.initialize();
    }

    //

    FlutterError.onError = (FlutterErrorDetails details) async {
      // Send to Zone handle
      Zone.current.handleUncaughtError(details.exception, details.stack!);
    };
    FlutterError.onError = (FlutterErrorDetails details) {
      // FlutterError.dumpErrorToConsole(details);
      final LogService logService = Get.find<LogService>();
      logService.e(details.exception.toString(), details.exception, details.stack);
      if (environment == Environment.release) exit(1);
    };
  }
}
