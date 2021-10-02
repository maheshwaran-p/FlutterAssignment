import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterassignment/data/movie_repository.dart';
import 'package:flutterassignment/models/movie_detail_model.dart';
import 'package:flutterassignment/models/movie_model.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;

  MovieBloc(this.movieRepository) : super(MovieInitial()) {
    on<SearchMovieEvent>(_serachMovie);
    on<MovieDetialEvent>(_detailMovie);
  }

  @override
  void onEvent(MovieEvent event) {
    print(event);
    super.onEvent(event);
  }

  FutureOr<void> _serachMovie(
      SearchMovieEvent event, Emitter<MovieState> emit) async {
    MovieSearchResponse response =
        await movieRepository.searchMovie(event.keyword);
    emit(SearchLoadedState(response));
  }

  FutureOr<void> _detailMovie(
      MovieDetialEvent event, Emitter<MovieState> emit) async {
    MovieDetail movieDetail = await movieRepository.getMovieDetail(event.id);
    emit(MovieDetailState(movieDetail));
  }
}
