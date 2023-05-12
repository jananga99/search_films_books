import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/constants/message_constants.dart';
import '../../../../common/constants/route_constants.dart';
import '../../../../common/enums/enums.dart';
import '../../../../common/models/book_models/book.dart';
import '../../../bloc/books_bloc/books_bloc.dart';
import '../../cards/book_card/book_card.dart';
import '../../empty_text/empty_text.dart';
import '../../error_text/error_text.dart';
import '../../idle_text/idle_text.dart';
import '../../loader/home_page_loader.dart';
import '../../no_connection_text/no_connection.dart';
import '../../paging_row/paging_row.dart';

class BookSection extends StatefulWidget {
  const BookSection({Key? key, required void Function(int) onPageSelected})
      : _onPageSelected = onPageSelected,
        super(key: key);
  final void Function(int) _onPageSelected;

  @override
  State<BookSection> createState() => _BookSectionState();
}

class _BookSectionState extends State<BookSection> {
  late BooksBloc _booksBloc;

  @override
  Widget build(BuildContext context) {
    void handleCardTap(Book book) {
      Navigator.of(context)
          .pushNamed(RouteConstants.bookRoute, arguments: book);
    }

    return LayoutBuilder(builder: (context, constraints) {
      return BlocBuilder<BooksBloc, BooksState>(
        buildWhen: (prev, current) => prev != current,
        builder: (context, state) {
          _booksBloc = context.read<BooksBloc>();
          return Column(
            children: [
              Visibility(
                visible: _booksBloc.state.status == BooksStatus.idle,
                child: const IdleText(SectionType.book),
              ),
              Visibility(
                visible: _booksBloc.state.status == BooksStatus.loading,
                child: const HomePageLoader(SectionType.book),
              ),
              Visibility(
                visible: _booksBloc.state.status == BooksStatus.succeeded &&
                    _booksBloc.state.books.isEmpty,
                child: const EmptyText(SectionType.book),
              ),
              Visibility(
                  visible: _booksBloc.state.status == BooksStatus.succeeded &&
                      state.books.isNotEmpty,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: constraints.maxWidth < 400 ? 2 : 3,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.43,
                        padding: const EdgeInsets.all(16),
                        physics: const NeverScrollableScrollPhysics(),
                        children: state.books
                            .map((book) => GestureDetector(
                                onTap: () => handleCardTap(book),
                                child: BookCard(book)))
                            .toList(),
                      ),
                      Visibility(
                        visible: _booksBloc.state.totalPages > 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PagingRow(
                            onPageSelected: widget._onPageSelected,
                            sectionType: SectionType.book,
                          ),
                        ),
                      )
                    ],
                  )),
              Visibility(
                visible: _booksBloc.state.status == BooksStatus.failed,
                child: _booksBloc.state.error == Messages.connectionError
                    ? const NoConnectionText()
                    : const ErrorText(SectionType.book),
              ),
            ],
          );
        },
      );
    });
  }
}
