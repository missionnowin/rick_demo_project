import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioClient {
  final Dio _dio;
  final SharedPreferences _prefs;

  DioClient(this._prefs) : _dio = Dio() {
    _dio.options.connectTimeout = const Duration(seconds: 20);
    _dio.options.baseUrl = 'https://rickandmortyapi.com/api/';

    _dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) async {
          await _cacheResponse(response.requestOptions.uri.toString(), response.data);
          return handler.next(response);
        },
        onError: (error, handler) async {
          try{
            final cachedResponse = await _getCachedResponse(error.requestOptions.uri.toString());
            if (cachedResponse != null) {
              return handler.resolve(Response(
                requestOptions: error.requestOptions,
                data: cachedResponse,
                statusCode: 200,
              ));
            }
            return handler.next(error);
          }catch(e){
            rethrow;
          }
        },
      ),
    );
  }

  Future<Map<String, dynamic>?> _getCachedResponse(String url) async {
    return jsonDecode(_prefs.getString(url) ?? '');
  }

  Future<void> _cacheResponse(String url, dynamic data) async {
    final jsonString = jsonEncode(data); // Serialize data to JSON string
    await _prefs.setString(url, jsonString);
  }

  Dio get dio => _dio;
}