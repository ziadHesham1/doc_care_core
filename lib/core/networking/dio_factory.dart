import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../helpers/shared_pref/shared_pref_helper.dart';
import '../helpers/shared_pref/shared_pref_keys.dart';

/// this class is a singleton the aim of it is to create a single dio instance
class DioFactory {
  // a private constructor I don't want to allow creating of an instance of this class
  DioFactory._();
  static Dio? dio;
  static Future<Dio> getDio() async {
    const Duration timeout = Duration(seconds: 30);

    if (dio == null) {
      var options = BaseOptions(
        connectTimeout: timeout,
        receiveTimeout: timeout,
      );
      dio = Dio(options);
      await addDioHeaders();
      addDioInterceptors();
    }
    return dio!;
  }

  static addDioHeaders() async {
    final token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.accessToken);
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    dio!.options.headers = headers;
  }

  static updateDioHeadersToken(String token) async {
    dio!.options.headers['Authorization'] = 'Bearer $token';
  }

  static addDioInterceptors() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ),
    );
  }
}
