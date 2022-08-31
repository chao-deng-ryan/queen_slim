import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queen_slim/services/log.service.dart';

class Config {
  final String baseUrl;
  final String authenticationUrl;
  final String utilUrl;
  final String managementUrl;
  final List<String> switchableEnvironments;
  final String? sentryDSN;
  final bool isMock;
  final LogLevel logLevel;

  static late Config _instance;

  factory Config({
    required String baseUrl,
    required String authenticationUrl,
    required String utilUrl,
    required String managementUrl,
    required List<String> switchableEnvironments,
    String? sentryDSN,
    required bool isMock,
    required LogLevel logLevel,
  }) {
    return _instance = Config._internal(
      baseUrl,
      authenticationUrl,
      utilUrl,
      managementUrl,
      switchableEnvironments,
      sentryDSN,
      isMock,
      logLevel,
    );
  }

  Config._internal(
    this.baseUrl,
    this.authenticationUrl,
    this.utilUrl,
    this.managementUrl,
    this.switchableEnvironments,
    this.sentryDSN,
    this.isMock,
    this.logLevel,
  );

  static Config get instance {
    return _instance;
  }

  static Future<void> initialize() async {
    //
  }
}
