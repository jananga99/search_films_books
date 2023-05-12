class Messages {
  static final movies = MovieMessages();
  static final tvs = TvMessages();
  static final books = BooksMessages();
  static const String connectionError = "Failed host lookup";
}

class MovieMessages {
  final String failed = "Movie loading failed";
}

class TvMessages {
  final String failed = "Tv loading failed";
}

class BooksMessages {
  final String failed = "Book loading failed";
}
