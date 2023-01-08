import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:news_app/services/networking_service.dart/app_exceptions.dart';

abstract class NetworkService {
  // 7ad604ca29d24895b27feea29777cd47
}

class NetworkClient {
  final Dio _dio = Dio();

  NetworkClient() {
    _dio.options.receiveTimeout = 60 * 1000;
    _dio.options.responseType = ResponseType.json;
  }

  Future<dynamic> getData({required url}) async {
    try {
      final response = await _dio.get(
        url,
      );
      log(response.data.toString());
      return response.data;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
