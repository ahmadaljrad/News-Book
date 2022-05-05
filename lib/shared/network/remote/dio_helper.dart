import 'package:dio/dio.dart';

class DioHelper {
  static String baseUrl = "https://newsapi.org/";
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(baseUrl: baseUrl, receiveDataWhenStatusError: true),
    );
  }

  static Future<Response> getData(
      {required String url, required dynamic querys}) async {
    return await dio.get(url, queryParameters: querys);
  }
}
