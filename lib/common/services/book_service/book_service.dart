import 'dart:convert';

import 'package:ftb/common/constants/ui_constants.dart';
import 'package:ftb/common/models/book_models/fetch_books_result.dart';
import 'package:http/http.dart' as http;

import '../../logger/logger.dart';
import '../../models/book_models/fetch_books_response.dart';
import '../../repositories/book_repository/book_repository.dart';

class BookService {
  final BookRepository _bookRepository;

  BookService(BookRepository bookRepository) : _bookRepository = bookRepository;

  Future<FetchBooksResult> fetchBooks(
      {required String searchText, int page = 1}) async {
    try {
      final http.Response response =
          await _bookRepository.fetchBooks(searchText: searchText, page: page);
      final FetchBooksResponse res =
          FetchBooksResponse.fromJson(jsonDecode(response.body));
      return FetchBooksResult(
          success: true,
          books: res.items,
          totalPages: res.totalItems ~/ DataGrid.itemsPerPage + 1,
          page: page);
    } catch (e) {
      logger.e('BookService fetchBooks Error: $e');
      return FetchBooksResult(success: false);
    }
  }
}
