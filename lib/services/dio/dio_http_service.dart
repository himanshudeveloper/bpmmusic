import 'package:bmp_music/features/bpm/services/read_music.dart';
import 'package:bmp_music/features/bpm/services/read_token.dart';
import 'package:bmp_music/services/dio/custom_interceptor.dart';
import 'package:bmp_music/services/dio/http_exception.dart';
import 'package:bmp_music/services/dio/http_service.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dioservice = DioHttpService();

/// Http service implementation using the Dio package
///
/// See https://pub.dev/packages/dio
///
///
///
class DioHttpService implements HttpService {
  /// Creates new instance of [DioHttpService]
  ///
  ///

  DioHttpService({
    Dio? dioOverride,
    bool enableCaching = true,
  }) {
    dio = dioOverride ?? Dio(baseOptions);

    dio.interceptors.addAll([prettyDioLogger, customInterceptor]);
  }

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

  /// The Dio Http client
  late final Dio dio;

  /// The Dio base options
  BaseOptions get baseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      );

  @override
  String get baseUrl => "https://api.music.apple.com/v1/";

  @override
  Map<String, String> headers = {
    'accept': 'application/json',
    "Content-Type": "application/json",
    "Authorization":
        "Bearer eyJraWQiOiJPR1ZJSkxJVElKIiwiYWxnIjoiRVMyNTYifQ.eyJpc3MiOiJaOEpFN0NXODZDIiwiaWF0IjoxNzIxMDY2MTkyLCJleHAiOjE3MjM2NTgxOTJ9.BCC_Eg1hi5R9RENyQHGj4dSdEZ3tDsAHaA439BFCfO7L8TKSqj0bRHvWbABdohvIfJJM_b2eFqz__lSpX8tCTQ",
  };

  @override
  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    bool forceRefresh = false,
    String? customBaseUrl,
  }) async {
    final String token = await readtoken();
    final String musictoken = await readMusic();

    print("tokennnnn  $token");
    final Response<dynamic> response = await dio.get(endpoint,
        queryParameters: queryParameters,
        options: Options(headers: <String, String>{
          'authorization': "Bearer $token",
          "Music-User-Token": musictoken
          // 'authorization':
          //     "Bearer eyJraWQiOiJPR1ZJSkxJVElKIiwiYWxnIjoiRVMyNTYifQ.eyJpc3MiOiJaOEpFN0NXODZDIiwiaWF0IjoxNzIxMDY2MTkyLCJleHAiOjE3MjM2NTgxOTJ9.BCC_Eg1hi5R9RENyQHGj4dSdEZ3tDsAHaA439BFCfO7L8TKSqj0bRHvWbABdohvIfJJM_b2eFqz__lSpX8tCTQ"
        }));

    // if (response.statusCode != 401) {
    //   Fluttertoast.showToast(msg: "Login Again");
    // }

    if (response.data == null || response.statusCode != 200) {
      throw HttpException(
        title: 'Http Error!',
        statusCode: response.statusCode,
        message: response.statusMessage,
      );
    }

    //Map<String, dynamic> responseMap = json.decode(response.data);

    return response.data;
  }

  @override
  Future<Map<String, dynamic>> post(
    String endpoint, {
    bool forceRefresh = false,
    Map<String, dynamic>? queryParameters,
  }) async {
    // String username = userCred.getUserId();
    // dynamic password = userCred.getSrKey();
    // String basicAuth =
    //     'Basic ${base64.encode(utf8.encode('$username:$password'))}';
    // Map<String, dynamic> data = <String, dynamic>{};
    // data['key'] = '1dskhdfsakKHda5d48sw65zHsocda-anflekze2@mkasdflk5';
    // //data['_method'] = 'put';
    // final Response<dynamic> response = await dio.post<dynamic>(
    //   endpoint,
    //   data: jsonEncode(
    //       {"key": "1dskhdfsakKHda5d48sw65zHsocda-anflekze2@mkasdflk5"}),

    //   options: Options(headers: <String, String>{'authorization': basicAuth}),
    //   //data: queryParameters,
    //   // queryParameters: queryParameters,
    //   onSendProgress: (count, total) {
    //     print("count $count total $total");
    //   },
    // );

    // if (response.data == null || response.statusCode != 200) {
    //   throw HttpException(
    //     title: 'Http Error!',
    //     statusCode: response.statusCode,
    //     message: response.statusMessage,
    //   );
    // }

    // Map<String, dynamic> responseMap = json.decode(response.data);

    // return responseMap;

    throw UnimplementedError();
  }

  @override
  Future<dynamic> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<dynamic> put() {
    // TODO: implement put
    throw UnimplementedError();
  }
}
