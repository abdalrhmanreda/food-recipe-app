import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'api_constant.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
    debugPrint('Initial Dio');
  }

  static Future<Response>? getData({
    required String url,
    Map<String, dynamic>? query,
  }) {
    return dio.get(url, queryParameters: query);
  }
}
