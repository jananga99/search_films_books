import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ftb/common/models/movie_models/fetch_movies_result.dart';
import 'package:ftb/common/services/movie_service/movie_service.dart';

import '../../../common/constants/message_constants.dart';
import '../../../common/models/movie_models/movie.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc(this._movieService) : super(const MoviesState()) {
    on<MoviesStarted>(_onMoviesStarted);
    on<MoviesFetched>(_onMoviesFetched);
    on<MoviesFailed>(_onMoviesFailed);
  }

  final MovieService _movieService;

  Future<void> _onMoviesStarted(
      MoviesStarted event, Emitter<MoviesState> emit) async {
    emit(state.copyWith(
        status: MoviesStatus.loading, error: null, movies: <Movie>[]));
    final FetchMoviesResult result = await _movieService.fetchMovies(
        searchText: event.searchText, page: event.page);
    if (result.success == true && result.movies != null) {
      add(MoviesFetched(
          movies: result.movies!,
          totalPages: result.totalPages!,
          page: result.page!));
    } else {
      add(MoviesFailed(
          result.error == null ? Messages.movies.failed : result.error!));
    }
  }

  void _onMoviesFetched(MoviesFetched event, Emitter<MoviesState> emit) {
    emit(state.copyWith(
        movies: event.movies,
        status: MoviesStatus.succeeded,
        totalPages: event.totalPages,
        page: event.page));
  }

  void _onMoviesFailed(MoviesFailed event, Emitter<MoviesState> emit) {
    emit(state.copyWith(error: event.error, status: MoviesStatus.failed));
  }
}
