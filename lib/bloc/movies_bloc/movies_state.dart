part of 'movies_bloc.dart';

enum MoviesStatus { idle, loading, succeeded, failed }

class MoviesState extends Equatable {
  const MoviesState(
      {this.status = MoviesStatus.idle,
      this.movies = const <Movie>[],
      this.error});

  final MoviesStatus status;
  final List<Movie> movies;
  final String? error;

  @override
  List<dynamic> get props => [status, movies, error];

  MoviesState copyWith(
      {MoviesStatus? status, List<Movie>? movies, String? error}) {
    return MoviesState(
        status: status ?? this.status,
        movies: movies ?? this.movies,
        error: error ?? this.error);
  }
}
