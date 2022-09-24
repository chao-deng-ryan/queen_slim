import 'package:dio/adapter.dart';
import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart' hide LogInterceptor;
import 'package:queen_slim/enums/http_status_code.enum.dart';
import 'package:queen_slim/interceptors/retry.interceptor.dart';
import 'package:queen_slim/services/log.service.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:system_proxy/system_proxy.dart';

const authenticationHttpServiceTag = 'authentication';
const utilHttpServiceTag = 'util';
const managementHttpServiceTag = 'management';

class QueenException {
  final String message;
  final int statusCode;
  const QueenException(this.statusCode, this.message);
}

class HttpService extends GetxService {
  final LogService logService = Get.find<LogService>();
  late Dio _client;
  late String _baseUrl;

  String get baseUrl => _baseUrl;

  HttpClientAdapter get httpClientAdapter => _client.httpClientAdapter;

  set httpClientAdapter(HttpClientAdapter httpClientAdapter) {
    _client.httpClientAdapter = httpClientAdapter;
  }

  // ignore: long-method, code-metrics
  Future<HttpService> initialize(String baseUrl, {bool useQueenInterceptor = true}) async {
    _baseUrl = baseUrl;
    _client = Dio();
    _client.options.baseUrl = baseUrl;
    _client.options.connectTimeout = 30000; //30s
    _client.options.receiveTimeout = 0;
    // 安卓机上配置系统代理
    if (GetPlatform.isAndroid) {
      final Map<String, String>? proxy = await SystemProxy.getProxySettings();
      if (proxy != null) {
        (_client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (_client) {
          _client.findProxy = (uri) {
            return "PROXY $proxy['host]:$proxy['port]";
          };
        };
      }
    }
    _client.interceptors.add(
      RetryInterceptor(
        dio: _client,
        options: RetryOptions(
          // Number of retries before a failure
          retries: 2,
          // Interval between each retry
          retryInterval: const Duration(seconds: 1),
          // Evaluating if a retry is necessary regarding the error.
          // It is a good candidate for updating authentication token in case of a unauthorized error (be careful with concurrency though)
          retryEvaluator: (error) => error.type != DioErrorType.cancel && error.type != DioErrorType.response,
        ),
      ),
    );
    return this;
  }

  // 重新设置url
  Future<HttpService> setBaseUrl(String baseUrl) async {
    _baseUrl = baseUrl;
    _client.options.baseUrl = baseUrl;
    return this;
  }

  Future<T?> getDynamic<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    bool showLoading = true,
  }) async {
    try {
      final response = await _client.get<T>(
        path,
        queryParameters: queryParameters,
        options: setShowLoadingInExtra(showLoading: showLoading, options: options),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (error, stackTrace) {
      if (error is DioError && error.response != null) {
        logService.e(error.response!.statusMessage ?? 'common.exception.http.request'.tr, error, stackTrace);
        throw QueenException(error.response!.statusCode!, error.response!.statusMessage!);
      } else {
        logService.e('common.exception.http.request'.tr, error, stackTrace);
        throw QueenException(HttpStatusCode.internalServerError.value, 'common.exception.http.request'.tr);
      }
    }
  }

  Future<Map<String, dynamic>?> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    bool showLoading = true,
  }) async {
    return getDynamic<Map<String, dynamic>>(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      showLoading: showLoading,
    );
  }

  Future<T?> postDynamic<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool showLoading = true,
  }) async {
    try {
      final response = await _client.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: setShowLoadingInExtra(showLoading: showLoading, options: options),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (error, stackTrace) {
      if (error is DioError && error.response != null) {
        logService.e(error.response!.statusMessage ?? 'common.exception.http.request'.tr, error, stackTrace);
        throw QueenException(error.response!.statusCode!, error.response!.statusMessage!);
      } else {
        logService.e('common.exception.http.request'.tr, error, stackTrace);
        throw QueenException(HttpStatusCode.internalServerError.value, 'common.exception.http.request'.tr);
      }
    }
  }

  Future<Map<String, dynamic>?> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool showLoading = true,
  }) async {
    return postDynamic<Map<String, dynamic>>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      showLoading: showLoading,
    );
  }

  Future<T?> putDynamic<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool showLoading = true,
  }) async {
    try {
      final response = await _client.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: setShowLoadingInExtra(showLoading: showLoading, options: options),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (error, stackTrace) {
      if (error is DioError && error.response != null) {
        logService.e(error.response!.statusMessage ?? 'common.exception.http.request'.tr, error, stackTrace);
        throw QueenException(error.response!.statusCode!, error.response!.statusMessage!);
      } else {
        logService.e('common.exception.http.request'.tr, error, stackTrace);
        throw QueenException(HttpStatusCode.internalServerError.value, 'common.exception.http.request'.tr);
      }
    }
  }

  Future<Map<String, dynamic>?> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool showLoading = true,
  }) async {
    return putDynamic<Map<String, dynamic>>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      showLoading: showLoading,
    );
  }

  Options setShowLoadingInExtra({required bool showLoading, Options? options}) {
    options ??= Options();
    options.extra ??= {};
    return options;
  }
}
