import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:queen_slim/config.dart';

enum LogLevel {
  verbose,
  debug,
  info,
  warning,
  error,
}

class LogService extends GetxService {
  Future<LogService> initialize() async {
    logger = Logger(
      printer: PrettyPrinter(
        colors: false, // 在mac上，有bug暂时不用
        printEmojis: false,
        printTime: true,
      ),
      level: _toLevel(Config.instance.logLevel),
    );
    simpleLogger = Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        colors: false,
        printEmojis: true,
        printTime: false,
      ),
      level: _toLevel(Config.instance.logLevel),
    );
    return this;
  }

  late Logger logger;

  late Logger simpleLogger; // 只有不需要详情时采用。大家尽量别用。

  Level _toLevel(LogLevel logLevel) {
    switch (logLevel) {
      case LogLevel.verbose:
        return Level.verbose;
      case LogLevel.debug:
        return Level.debug;
      case LogLevel.info:
        return Level.info;
      case LogLevel.warning:
        return Level.warning;
      case LogLevel.error:
        return Level.error;
      default:
        return Level.info;
    }
  }

  /// Log a message at level [Level.verbose].
  void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.v(message);
  }

  /// Log a message at level [Level.debug].
  void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.d(message);
  }

  /// Log a message at level [Level.info].
  void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.i(message);
  }

  /// Log a message at level [Level.warning].
  void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.w(message);
  }

  /// Log a message at level [Level.error].
  void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.e(message, [error, stackTrace]);
  }
}
