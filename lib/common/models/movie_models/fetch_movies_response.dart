import 'package:ftb/common/models/movie_models/movie.dart';

class FetchMoviesResponse {
  FetchMoviesResponse(
      {required this.page, required this.results, required this.totalPages});
  final int page;
  final List<Movie> results;
  final int totalPages;
  factory FetchMoviesResponse.fromJson(Map<String, dynamic> json) {
    return FetchMoviesResponse(
      page: json['page'],
      totalPages: json['total_pages'],
      results: List<Movie>.from(json['results'].map((e) => Movie.fromJson(e))),
    );
  }
}
