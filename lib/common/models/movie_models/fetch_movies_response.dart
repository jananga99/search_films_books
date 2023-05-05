import 'package:ftb/common/models/movie_models/movie.dart';

class FetchMoviesResponse {
  FetchMoviesResponse({required this.page, required this.results});
  final int page;
  final List<Movie> results;
  factory FetchMoviesResponse.fromJson(Map<String, dynamic> json) {
    return FetchMoviesResponse(
      page: json['page'],
      results: List<Movie>.from(json['results'].map((e) => Movie.fromJson(e))),
    );
  }
}
