import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

class DioClient {
  final Dio _dio;

  DioClient() : _dio = Dio() {
    _dio.options.connectTimeout = const Duration(seconds: 20);
    _dio.options.baseUrl = 'https://rickandmortyapi.com/api/';

    final cacheOptions = CacheOptions(
      store: MemCacheStore(),
      policy: CachePolicy.request,
      hitCacheOnErrorExcept: const [401, 403],
      maxStale: const Duration(days: 7),
      priority: CachePriority.normal,
      cipher: null,
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      allowPostMethod: false,
    );
    _dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));
  }

  Dio get dio => _dio;
}