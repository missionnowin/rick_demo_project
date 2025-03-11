import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  DioClient() : _dio = Dio() {
    _dio.options.baseUrl = 'https://jsonplaceholder.typicode.com';
  }

  Dio get dio => _dio;
}