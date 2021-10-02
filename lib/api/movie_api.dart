import 'package:dio/dio.dart';
import 'package:flutterassignment/models/movie_detail_model.dart';
import 'package:flutterassignment/models/movie_model.dart';

class MovieApi {
  static const BASE_URL = "https://omdbapi.com";
  Dio _dio = Dio();
  MovieApi() {
    _dio.options.headers['content-Type'] = 'application/json';
    _dio.options.baseUrl = BASE_URL;
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
    if (response.statusCode == 200) {
      return MovieDetail.fromMap(response.data);
    } else {
      throw Exception('Failed to load user post');
    }
  }
}
