import 'dart:convert';

import 'package:ftb/common/models/movie_models/fetch_movies_response.dart';
import 'package:ftb/common/models/movie_models/fetch_movies_result.dart';
import 'package:http/http.dart' as http;

import '../../constants/message_constants.dart';
import '../../logger/logger.dart';
import '../../repositories/movie_repository/movie_repository.dart';

class MovieService {
  final MovieRepository _movieRepository;

  MovieService(MovieRepository movieRepository)
      : _movieRepository = movieRepository;

  Future<FetchMoviesResult> fetchMovies(
      {required String searchText, int page = 1}) async {
    try {
      final http.Response response = await _movieRepository.fetchMovies(
          searchText: searchText, page: page);
      final FetchMoviesResponse res =
          FetchMoviesResponse.fromJson(jsonDecode(response.body));
      return FetchMoviesResult(
          success: true,
          movies: res.results,
          totalPages: res.totalPages,
          page: res.page);
    } catch (e) {
      String? error;
      if (e.toString().startsWith(Messages.connectionError)) {
        error = Messages.connectionError;
      } else {
        logger.e('MovieService fetchMovies Error: $e');
      }
      return FetchMoviesResult(
          success: false, error: error ?? Messages.movies.failed);
    }
  }
}
