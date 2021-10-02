import 'package:flutterassignment/api/movie_api.dart';
import 'package:flutterassignment/models/movie_detail_model.dart';
import 'package:flutterassignment/models/movie_model.dart';

class MovieRepository {
  final MovieApi _movieApi = MovieApi();
  Future<MovieSearchResponse> searchMovie(String keyword) =>
      _movieApi.searchMovie(keyword);
  Future<MovieDetail> getMovieDetail(String id) => _movieApi.getMovieDetail(id);
}
