part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class SearchMovieEvent extends MovieEvent {
  final String keyword;

  SearchMovieEvent(this.keyword);
}

class MovieDetialEvent extends MovieEvent {
  final String id;

  MovieDetialEvent(this.id);
}
