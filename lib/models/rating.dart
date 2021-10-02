import 'dart:convert';

class Rating {
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
  String toString() => 'Rating(Source: $Source, Value: $Value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Rating &&
      other.Source == Source &&
      other.Value == Value;
  }

  @override
  int get hashCode => Source.hashCode ^ Value.hashCode;
}