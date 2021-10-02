import 'package:flutterassignment/api/movie_api.dart';
import 'package:flutterassignment/data/shared_preference_service.dart';
import 'package:flutterassignment/models/movie_detail_model.dart';
import 'package:flutterassignment/models/movie_model.dart';

class MovieRepository {
  final MovieApi _movieApi = MovieApi();
  final SharedPreferenceService sharedPreferenceService;

  MovieRepository(this.sharedPreferenceService);
  Future<MovieSearchResponse> searchMovie(String keyword) =>
      _movieApi.searchMovie(keyword);
  Future<MovieDetail> getMovieDetail(String id) => _movieApi.getMovieDetail(id);

  Future<MovieSearchResponse?> getResponse() async =>
      await sharedPreferenceService.getResponse();

  void setResponse(MovieSearchResponse response) {
    sharedPreferenceService.response = response;
    print("setting reponse");
  }
}
