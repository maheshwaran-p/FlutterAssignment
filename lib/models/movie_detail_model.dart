import 'dart:convert';

import 'package:equatable/equatable.dart';

class MovieDetail extends Equatable {
  final String Title;
  final String Year;
  final String Rated;
  final String Released;
  final String Runtime;
  final String Genre;
  final String Director;
  final String Writer;
  final String Actors;
  final String Plot;
  final String Language;
  final String Country;
  final String Awards;
  final String Poster;
  final List<Rating> Ratings;
  final String Metascore;
  final String imdbRating;
  final String imdbVotes;
  final String imdbID;
  final String Type;
  final String DVD;
  final String BoxOffice;
  final String Production;
  final String Website;
  final String Response;
  MovieDetail({
    required this.Title,
    required this.Year,
    required this.Rated,
    required this.Released,
    required this.Runtime,
    required this.Genre,
    required this.Director,
    required this.Writer,
    required this.Actors,
    required this.Plot,
    required this.Language,
    required this.Country,
    required this.Awards,
    required this.Poster,
    required this.Ratings,
    required this.Metascore,
    required this.imdbRating,
    required this.imdbVotes,
    required this.imdbID,
    required this.Type,
    required this.DVD,
    required this.BoxOffice,
    required this.Production,
    required this.Website,
    required this.Response,
  });

  MovieDetail copyWith({
    String? Title,
    String? Year,
    String? Rated,
    String? Released,
    String? Runtime,
    String? Genre,
    String? Director,
    String? Writer,
    String? Actors,
    String? Plot,
    String? Language,
    String? Country,
    String? Awards,
    String? Poster,
    List<Rating>? Ratings,
    String? Metascore,
    String? imdbRating,
    String? imdbVotes,
    String? imdbID,
    String? Type,
    String? DVD,
    String? BoxOffice,
    String? Production,
    String? Website,
    String? Response,
  }) {
    return MovieDetail(
      Title: Title ?? this.Title,
      Year: Year ?? this.Year,
      Rated: Rated ?? this.Rated,
      Released: Released ?? this.Released,
      Runtime: Runtime ?? this.Runtime,
      Genre: Genre ?? this.Genre,
      Director: Director ?? this.Director,
      Writer: Writer ?? this.Writer,
      Actors: Actors ?? this.Actors,
      Plot: Plot ?? this.Plot,
      Language: Language ?? this.Language,
      Country: Country ?? this.Country,
      Awards: Awards ?? this.Awards,
      Poster: Poster ?? this.Poster,
      Ratings: Ratings ?? this.Ratings,
      Metascore: Metascore ?? this.Metascore,
      imdbRating: imdbRating ?? this.imdbRating,
      imdbVotes: imdbVotes ?? this.imdbVotes,
      imdbID: imdbID ?? this.imdbID,
      Type: Type ?? this.Type,
      DVD: DVD ?? this.DVD,
      BoxOffice: BoxOffice ?? this.BoxOffice,
      Production: Production ?? this.Production,
      Website: Website ?? this.Website,
      Response: Response ?? this.Response,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Title': Title,
      'Year': Year,
      'Rated': Rated,
      'Released': Released,
      'Runtime': Runtime,
      'Genre': Genre,
      'Director': Director,
      'Writer': Writer,
      'Actors': Actors,
      'Plot': Plot,
      'Language': Language,
      'Country': Country,
      'Awards': Awards,
      'Poster': Poster,
      'Ratings': Ratings.map((x) => x.toMap()).toList(),
      'Metascore': Metascore,
      'imdbRating': imdbRating,
      'imdbVotes': imdbVotes,
      'imdbID': imdbID,
      'Type': Type,
      'DVD': DVD,
      'BoxOffice': BoxOffice,
      'Production': Production,
      'Website': Website,
      'Response': Response,
    };
  }

  factory MovieDetail.fromMap(Map<String, dynamic> map) {
    return MovieDetail(
      Title: map['Title'],
      Year: map['Year'],
      Rated: map['Rated'],
      Released: map['Released'],
      Runtime: map['Runtime'],
      Genre: map['Genre'],
      Director: map['Director'],
      Writer: map['Writer'],
      Actors: map['Actors'],
      Plot: map['Plot'],
      Language: map['Language'],
      Country: map['Country'],
      Awards: map['Awards'],
      Poster: map['Poster'],
      Ratings: List<Rating>.from(map['Ratings']?.map((x) => Rating.fromMap(x))),
      Metascore: map['Metascore'],
      imdbRating: map['imdbRating'],
      imdbVotes: map['imdbVotes'],
      imdbID: map['imdbID'],
      Type: map['Type'],
      DVD: map['DVD'],
      BoxOffice: map['BoxOffice'],
      Production: map['Production'],
      Website: map['Website'],
      Response: map['Response'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDetail.fromJson(String source) =>
      MovieDetail.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      Title,
      Year,
      Rated,
      Released,
      Runtime,
      Genre,
      Director,
      Writer,
      Actors,
      Plot,
      Language,
      Country,
      Awards,
      Poster,
      Ratings,
      Metascore,
      imdbRating,
      imdbVotes,
      imdbID,
      Type,
      DVD,
      BoxOffice,
      Production,
      Website,
      Response,
    ];
  }
}

class Rating extends Equatable {
  final String Source;
  final String Value;
  Rating({
    required this.Source,
    required this.Value,
  });

  Rating copyWith({
    String? Source,
    String? Value,
  }) {
    return Rating(
      Source: Source ?? this.Source,
      Value: Value ?? this.Value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Source': Source,
      'Value': Value,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      Source: map['Source'],
      Value: map['Value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Rating.fromJson(String source) => Rating.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [Source, Value];
}
