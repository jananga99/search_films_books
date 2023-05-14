import 'book.dart';

class FetchBooksResult {
  FetchBooksResult(
      {required this.success,
      this.books,
      this.error,
      this.totalPages,
      this.page});
  final bool success;
  final String? error;
  final List<Book>? books;
  final int? totalPages;
  final int? page;
}
