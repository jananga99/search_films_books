import 'package:ftb/common/models/movie_models/fetch_movies_return_type.dart';

class MovieService {
  Future<FetchMoviesResult> fetchMovies(String searchText) async {
    return FetchMoviesResult(success: false);
  }
}
