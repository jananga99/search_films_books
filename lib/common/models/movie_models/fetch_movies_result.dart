import 'movie.dart';

class FetchMoviesResult {
  FetchMoviesResult(
      {required this.success,
      this.movies,
      this.error,
      this.totalPages,
      this.page});
  final bool success;
  final String? error;
  final List<Movie>? movies;
  final int? totalPages;
  final int? page;
}
