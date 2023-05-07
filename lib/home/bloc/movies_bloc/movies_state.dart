part of 'movies_bloc.dart';

enum MoviesStatus { idle, loading, succeeded, failed }

class MoviesState extends Equatable {
  const MoviesState(
      {this.status = MoviesStatus.idle,
      this.movies = const <Movie>[],
      this.totalPages = 0,
      this.page = 0,
      this.error});

  final MoviesStatus status;
  final List<Movie> movies;
  final int totalPages;
  final int page;
  final String? error;

  @override
  List<dynamic> get props => [
        status,
        movies,
        totalPages,
        page,
        error,
      ];

  MoviesState copyWith({
    MoviesStatus? status,
    List<Movie>? movies,
    int? page,
    int? totalPages,
    String? error,
  }) {
    return MoviesState(
        status: status ?? this.status,
        movies: movies ?? this.movies,
        totalPages: totalPages ?? this.totalPages,
        page: page ?? this.page,
        error: error ?? this.error);
  }
}
