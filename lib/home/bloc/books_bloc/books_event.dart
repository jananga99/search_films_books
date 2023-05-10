part of 'books_bloc.dart';

abstract class BooksEvent extends Equatable {
  const BooksEvent();
  @override
  List<dynamic> get props => [];
}

class BooksStarted extends BooksEvent {
  const BooksStarted({required this.searchText, this.page = 1});
  final String searchText;
  final int page;
  @override
  List<dynamic> get props => [searchText, page];
}

class BooksFetched extends BooksEvent {
  const BooksFetched(
      {required this.books, required this.page, required this.totalPages});
  final List<Book> books;
  final int page;
  final int totalPages;
  @override
  List<Object> get props => [books, page, totalPages];
}

class BooksFailed extends BooksEvent {
  const BooksFailed(this.error);
  final String error;
  @override
  List<Object> get props => [error];
}
