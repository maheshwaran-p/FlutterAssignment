import 'package:dio/dio.dart';
import 'package:flutterassignment/models/movie_detail_model.dart';
import 'package:flutterassignment/models/movie_model.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

class MovieApi {
  static const BASE_URL = "https://omdbapi.com";
  Dio _dio = Dio();
  MovieApi() {
    _dio.options.headers['content-Type'] = 'application/json';
    _dio.options.baseUrl = BASE_URL;
    CacheOptions _cacheOptions = CacheOptions(
      store: MemCacheStore(),
      policy: CachePolicy.request,
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(days: 7),
      priority: CachePriority.normal,
      cipher: null,
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      allowPostMethod: false,
    );
    _dio..interceptors.add(DioCacheInterceptor(options: _cacheOptions));
  }

  Future<MovieSearchResponse> searchMovie(String keyword) async {
    final Response response = await _dio.get("/", queryParameters: {
      "s": keyword,
      "apikey": "35882e11",
    });
    if (response.statusCode == 200) {
      return MovieSearchResponse.fromMap(response.data);
    } else {
      throw Exception('Failed to load user post');
    }
  }

  Future<MovieDetail> getMovieDetail(String id) async {
    final Response response = await _dio.get("/", queryParameters: {
      "i": id,
      "apikey": "35882e11",
    });
    print(response);
    try {
      return MovieDetail.fromMap(response.data);
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
