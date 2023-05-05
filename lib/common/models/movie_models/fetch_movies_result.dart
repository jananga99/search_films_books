import 'movie.dart';

class FetchMoviesResult {
  FetchMoviesResult({required this.success, this.movies, this.error});
  final bool success;
  final String? error;
  final List<Movie>? movies;
}
