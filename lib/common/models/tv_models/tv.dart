class Tv {
  final bool adult;
  final String backdropPath;
  final int id;
  final String name;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final String posterPath;
  final String mediaType;
  final List<int> genreIds;
  final double popularity;
  final String firstAirDate;
  final double voteAverage;
  final String voteCount;
  final List<String> originCountry;

  const Tv({
    required this.id,
    required this.name,
    required this.adult,
    required this.backdropPath,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.genreIds,
    required this.popularity,
    required this.firstAirDate,
    required this.voteAverage,
    required this.voteCount,
    required this.originCountry,
  });

  factory Tv.fromJson(Map<String, dynamic> json) {
    print(json);
    return Tv(
      id: json['id'],
      name: json['name'],
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      originalLanguage: json['original_language'],
      originalName: json['original_name'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      mediaType: json['media_type'],
      genreIds: json['genre_ids'],
      popularity: json['popularity'],
      firstAirDate: json['first_air_date'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      originCountry: json['origin_country'],
    );
  }
}
