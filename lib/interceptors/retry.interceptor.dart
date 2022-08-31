import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:queen_slim/services/log.service.dart';

/// 参考：https://github.com/aloisdeniel/dio_retry

typedef RetryEvaluator = FutureOr<bool> Function(DioError error);

class RetryOptions {
  /// The number of retry in case of an error
  final int retries;

  /// The interval before a retry.
  final Duration retryInterval;

  /// Evaluating if a retry is necessary.regarding the error.
  ///
  /// It can be a good candidate for additional operations too, like
  /// updating authentication token in case of a unauthorized error (be careful
  /// with concurrency though).
  ///
  /// Defaults to [defaultRetryEvaluator].
  RetryEvaluator get retryEvaluator => _retryEvaluator ?? defaultRetryEvaluator;

  final RetryEvaluator? _retryEvaluator;

  const RetryOptions({this.retries = 3, RetryEvaluator? retryEvaluator, this.retryInterval = const Duration(seconds: 1)})
      : _retryEvaluator = retryEvaluator;

  factory RetryOptions.noRetry() {
    return const RetryOptions(
      retries: 0,
    );
  }

  static const extraRetryKey = "cache_retry_request";

  /// Returns [true] only if the response hasn't been cancelled or got
  /// a bas status code.
  static FutureOr<bool> defaultRetryEvaluator(DioError error) {
    return error.type != DioErrorType.cancel && error.type != DioErrorType.response;
  }

  factory RetryOptions.fromExtra(RequestOptions request) {
    if (request.extra[extraRetryKey] == null) {
      return const RetryOptions();
    } else {
      return request.extra[extraRetryKey] as RetryOptions;
    }
  }

  RetryOptions copyWith({
    int? retries,
    Duration? retryInterval,
  }) =>
      RetryOptions(
        retries: retries ?? this.retries,
        retryInterval: retryInterval ?? this.retryInterval,
      );

  Map<String, dynamic> toExtra() {
    return {
      extraRetryKey: this,
    };
  }

  Options toOptions() {
    return Options(extra: toExtra());
  }

  Options mergeIn(Options options) {
    if (options.extra == null) {
      return toOptions();
    } else {
      options.extra!.addAll(toExtra());
      return options;
    }
  }
}

class RetryInterceptor extends Interceptor {
  final LogService logService = Get.find<LogService>();
  final Dio dio;
  final RetryOptions options;

  RetryInterceptor({
    required this.dio,
    RetryOptions? options,
  }) : options = options ?? const RetryOptions();

  @override
  Future onRequest(RequestOptions requestOptions, RequestInterceptorHandler handler) async {
    return handler.next(requestOptions);
  }

  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) async {
    return handler.next(response);
  }

  @override
  Future onError(DioError error, ErrorInterceptorHandler handler) async {
    RetryOptions extra = RetryOptions.fromExtra(error.requestOptions);
    final bool shouldRetry = extra.retries > 0 && await extra.retryEvaluator(error) && (error.response != null && error.response!.statusCode != 401);
    if (shouldRetry) {
      if (extra.retryInterval.inMilliseconds > 0) {
        await Future.delayed(extra.retryInterval);
      }

      // Update options to decrease retry count before new try
      extra = extra.copyWith(retries: extra.retries - 1);
      error.requestOptions.extra = error.requestOptions.extra..addAll(extra.toExtra());
      logService.w("[${error.requestOptions.uri}] 请求出错，进行重试... (剩余重试次数: ${extra.retries}, 错误内容: ${error.error}, 错误堆栈： ${error.stackTrace})");
      final Options options = Options(
        headers: error.requestOptions.headers,
        method: error.requestOptions.method,
        sendTimeout: error.requestOptions.sendTimeout,
        receiveTimeout: error.requestOptions.receiveTimeout,
        extra: error.requestOptions.extra,
      );
      return dio.request(
        error.requestOptions.path,
        cancelToken: error.requestOptions.cancelToken,
        data: error.requestOptions.data,
        onReceiveProgress: error.requestOptions.onReceiveProgress,
        onSendProgress: error.requestOptions.onSendProgress,
        queryParameters: error.requestOptions.queryParameters,
        options: options,
      );
    }
    return handler.next(error);
  }
}
