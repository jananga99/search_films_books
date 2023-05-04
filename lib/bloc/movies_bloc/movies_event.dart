part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();
  @override
  List<Object> get props => [];
}

class MoviesStarted extends MoviesEvent {
  const MoviesStarted(this.searchText);
  final String searchText;
  @override
  List<Object> get props => [searchText];
}

class MoviesFetched extends MoviesEvent {
  const MoviesFetched(this.movies);
  final List<Movie> movies;
  @override
  List<Object> get props => [movies];
}

class MoviesFailed extends MoviesEvent {
  const MoviesFailed(this.error);
  final String error;
  @override
  List<Object> get props => [error];
}
