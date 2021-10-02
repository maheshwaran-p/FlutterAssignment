part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {}

class MovieInitial extends MovieState {
  @override
  List<Object?> get props => [];
}

class SearchLoadedState extends MovieState {
  final MovieSearchResponse response;

  SearchLoadedState(this.response);

  @override
  List<Object> get props => [response];
}

class DetailLoadingState extends MovieState {
  @override
  List<Object?> get props => [];
}

class MovieDetailState extends MovieState {
  final MovieDetail movieDetail;

  MovieDetailState(this.movieDetail);
  @override
  List<Object> get props => [movieDetail];
}
