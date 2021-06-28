import 'package:dio/dio.dart';

class DioHelper {
  static const apiKey = '2e9d3aa4a2864020ac8e8df4a704d08f';
  static const _baseUrl = 'https://newsapi.org/v2/';

  static Dio? dio;

  static init() {
    if (dio == null) {
      dio = Dio(BaseOptions(
        baseUrl: _baseUrl,
        receiveDataWhenStatusError: true,
      ));
    }
  }

  static Future<Response> getData(
      {required String method, required Map<String, dynamic> query,}) async {
    return await dio!.get(method, queryParameters: query);
  }
}
