part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();
  @override
  List<dynamic> get props => [];
}

class MoviesStarted extends MoviesEvent {
  const MoviesStarted({required this.searchText, this.page = 1});
  final String searchText;
  final int page;
  @override
  List<dynamic> get props => [searchText, page];
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
