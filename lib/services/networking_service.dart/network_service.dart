import 'package:dio/dio.dart';

import 'package:news_app/services/networking_service.dart/app_exceptions.dart';

abstract class NetworkService {
  Future<dynamic> getData({required url});
}

class NetworkClientImpl extends NetworkService {
  final Dio _dio = Dio();

  NetworkClientImpl() {
    _dio.options.connectTimeout = 15000;
    _dio.options.receiveTimeout = 9000;
    _dio.options.responseType = ResponseType.json;
  }

  @override
  Future<dynamic> getData({required url}) async {
    try {
      final response = await _dio.get(
        url,
      );
      return response.data;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
