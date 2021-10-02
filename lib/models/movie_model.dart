import 'dart:convert';

import 'package:equatable/equatable.dart';

class MovieSearchResponse extends Equatable {
  final List<Movie> movies;
  final String totalResults;
  final String Response;
  MovieSearchResponse({
    required this.movies,
    required this.totalResults,
    required this.Response,
  });

  MovieSearchResponse copyWith({
    List<Movie>? Search,
    String? totalResults,
    String? Response,
  }) {
    return MovieSearchResponse(
      movies: Search ?? this.movies,
      totalResults: totalResults ?? this.totalResults,
      Response: Response ?? this.Response,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Search': movies.map((x) => x.toMap()).toList(),
      'totalResults': totalResults,
      'Response': Response,
    };
  }

  factory MovieSearchResponse.fromMap(Map<String, dynamic> map) {
    return MovieSearchResponse(
      movies: List<Movie>.from(map['Search']?.map((x) => Movie.fromMap(x))),
      totalResults: map['totalResults'],
      Response: map['Response'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieSearchResponse.fromJson(String source) =>
      MovieSearchResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'MovieSearchResponse(Search: $movies, totalResults: $totalResults, Response: $Response)';

  @override
  List<Object> get props => [movies, totalResults, Response];
}

class Movie extends Equatable {
  final String Title;
  final String Year;
  final String imdbID;
  final String Type;
  final String Poster;
  Movie({
    required this.Title,
    required this.Year,
    required this.imdbID,
    required this.Type,
    required this.Poster,
  });

  Movie copyWith({
    String? Title,
    String? Year,
    String? imdbID,
    String? Type,
    String? Poster,
  }) {
    return Movie(
      Title: Title ?? this.Title,
      Year: Year ?? this.Year,
      imdbID: imdbID ?? this.imdbID,
      Type: Type ?? this.Type,
      Poster: Poster ?? this.Poster,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Title': Title,
      'Year': Year,
      'imdbID': imdbID,
      'Type': Type,
      'Poster': Poster,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      Title: map['Title'],
      Year: map['Year'],
      imdbID: map['imdbID'],
      Type: map['Type'],
      Poster: map['Poster'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Search(Title: $Title, Year: $Year, imdbID: $imdbID, Type: $Type, Poster: $Poster)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Movie &&
        other.Title == Title &&
        other.Year == Year &&
        other.imdbID == imdbID &&
        other.Type == Type &&
        other.Poster == Poster;
  }

  @override
  int get hashCode {
    return Title.hashCode ^
        Year.hashCode ^
        imdbID.hashCode ^
        Type.hashCode ^
        Poster.hashCode;
  }

  @override
  List<Object> get props {
    return [
      Title,
      Year,
      imdbID,
      Type,
      Poster,
    ];
  }
}
