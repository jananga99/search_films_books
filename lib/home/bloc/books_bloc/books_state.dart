part of 'books_bloc.dart';

enum BooksStatus { idle, loading, succeeded, failed }

class BooksState extends Equatable {
  const BooksState(
      {this.status = BooksStatus.idle,
      this.books = const <Book>[],
      this.page = 0,
      this.totalPages = 0,
      this.error});

  final BooksStatus status;
  final List<Book> books;
  final int totalPages;
  final int page;
  final String? error;

  @override
  List<dynamic> get props => [status, books, page, totalPages, error];

  BooksState copyWith(
      {BooksStatus? status,
      List<Book>? books,
      int? page,
      int? totalPages,
      String? error}) {
    return BooksState(
        status: status ?? this.status,
        books: books ?? this.books,
        page: page ?? this.page,
        totalPages: totalPages ?? this.totalPages,
        error: error ?? this.error);
  }
}
