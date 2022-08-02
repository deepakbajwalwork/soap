import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';
import 'package:get_storage/get_storage.dart';
import 'package:souapp/helpers/app_manager.dart';
import 'package:souapp/helpers/end_points.dart';
import 'package:souapp/utils/appstrings.dart';

/// The NetworkManager class provide an API network requests
class NetworkManager {
  static final NetworkManager _apiService = NetworkManager._internal();

  Dio _dio = Dio();

  bool isContentTypeJson = true;
  bool _isHttpRequest = false;
  bool _urlEncode = false;
  String baseUrl = Endpoints.baseURL;
  String? appUrl;

  factory NetworkManager() {
    return _apiService;
  }

  NetworkManager._internal();

  getDio(
      {isJsonType = true, isHttpRequest = false, isUrlEncoded = false}) async {
    isContentTypeJson = isJsonType;
    _urlEncode = isUrlEncoded;
    _isHttpRequest = isHttpRequest;
    await _init();
    return _dio;
  }

  static NetworkManager get instance => _apiService;

  _init() async {
    _dio = Dio();
    _dio.options.baseUrl = baseUrl;
    _dio.options.contentType = Headers.jsonContentType;
    _dio.interceptors.add(LogInterceptor());
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      canShowLog: false,
    ));

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (AppManager.statusHelper.getLoginStatus) {
            String postToken = GetStorage().read(AppStrings.token);
            options.headers["Authorization"] = "Bearer $postToken";
          }

          if (isContentTypeJson) {
            options.headers["Content-Type"] = "application/json";
          }

          if (_urlEncode) {
            options.headers["Content-Type"] =
                "application/x-www-form-urlencoded";
          }

          if (_isHttpRequest) {
            options.headers["X-Requested-With"] = "XMLHttpRequest";
          }
          return handler.next(options); //continue
        },
        onResponse: (response, handler) {
          return handler.next(response); // continue
        },
        onError: (DioError e, handler) {
          if (!kReleaseMode) {
            // AppSnackbar.showSnackbar(
            //   "API ERROR : ${e.requestOptions.path}",
            //   e.response.toString(),
            //   AlertType.internalInfo,
            //   position: SnackPosition.BOTTOM,
            //   duration: const Duration(seconds: 10),
            // );
          }
          return handler.next(e); //continue
        },
      ),
    );

    _dio.options.receiveTimeout = 30000;
  }
}
