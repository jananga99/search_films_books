import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ftb/common/models/book_models/fetch_books_result.dart';

import '../../../common/constants/message_constants.dart';
import '../../../common/models/book_models/book.dart';
import '../../../common/services/book_service/book_service.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc(this._booksService) : super(const BooksState()) {
    on<BooksStarted>(_onBookStarted);
    on<BooksFetched>(_onBooksFetched);
    on<BooksFailed>(_onBooksFailed);
  }

  final BookService _booksService;

  Future<void> _onBookStarted(
      BooksStarted event, Emitter<BooksState> emit) async {
    emit(state
        .copyWith(status: BooksStatus.loading, error: null, books: <Book>[]));
    final FetchBooksResult result = await _booksService.fetchBooks(
        searchText: event.searchText, page: event.page);
    if (result.success == true && result.books != null) {
      add(BooksFetched(
          totalPages: result.totalPages!,
          page: result.page!,
          books: result.books!));
    } else {
      add(BooksFailed(
          result.error == null ? Messages.books.failed : result.error!));
    }
  }

  void _onBooksFetched(BooksFetched event, Emitter<BooksState> emit) {
    emit(state.copyWith(
        books: event.books,
        status: BooksStatus.succeeded,
        totalPages: event.totalPages,
        page: event.page));
  }

  void _onBooksFailed(BooksFailed event, Emitter<BooksState> emit) {
    emit(state.copyWith(error: event.error, status: BooksStatus.failed));
  }
}
