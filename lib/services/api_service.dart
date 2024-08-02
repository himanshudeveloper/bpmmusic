import 'package:bmp_music/services/dio/custom_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  final _baseUrl = "https://api.music.apple.com/v1/catalog/";
  final _receiveTimeout = const Duration(seconds: 5);
  final _connectTimeout = const Duration(seconds: 5);
  final _sendTimeout = const Duration(seconds: 5);

  late Dio _dio;

  ApiService._internal();

  static final ApiService _apiService = ApiService._internal();

  factory ApiService() => _apiService;

  Dio provideDio() {
    BaseOptions baseOptions = BaseOptions(
        baseUrl: _baseUrl,
        receiveTimeout: _receiveTimeout,
        connectTimeout: _connectTimeout,
        sendTimeout: _sendTimeout,
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              "Bearer eyJraWQiOiJPR1ZJSkxJVElKIiwiYWxnIjoiRVMyNTYifQ.eyJpc3MiOiJaOEpFN0NXODZDIiwiaWF0IjoxNzIxMDY2MTkyLCJleHAiOjE3MjM2NTgxOTJ9.BCC_Eg1hi5R9RENyQHGj4dSdEZ3tDsAHaA439BFCfO7L8TKSqj0bRHvWbABdohvIfJJM_b2eFqz__lSpX8tCTQ",
        });

    PrettyDioLogger prettyDioLogger = PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    );
    Interceptor customInterceptor = CustomInterceptor();

    _dio = Dio(baseOptions);

    // Add the Interceptors here
    _dio.interceptors.addAll({
      prettyDioLogger,
      customInterceptor,
    });

    return _dio;
  }
}
