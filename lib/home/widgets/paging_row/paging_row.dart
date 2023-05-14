import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftb/common/enums/enums.dart';
import 'package:ftb/home/bloc/tv_bloc/tv_bloc.dart';
import 'package:ftb/home/widgets/page_number/page_number.dart';

import '../../bloc/books_bloc/books_bloc.dart';
import '../../bloc/movies_bloc/movies_bloc.dart';

class PagingRow extends StatelessWidget {
  final void Function(int) _onPageSelected;
  final SectionType _sectionType;

  const PagingRow(
      {super.key,
      required void Function(int) onPageSelected,
      required SectionType sectionType})
      : _sectionType = sectionType,
        _onPageSelected = onPageSelected;

  @override
  Widget build(BuildContext context) {
    const Color enabledColor = Colors.black;
    const Color disabledColor = Colors.grey;

    final List<Widget> pageButtons = [];

    if (_sectionType == SectionType.movie) {
      return LayoutBuilder(builder: (context, constraints) {
        return BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            pageButtons.add(
              IconButton(
                icon: const Icon(Icons.first_page),
                color: state.page == 1 ? disabledColor : enabledColor,
                onPressed: state.page == 1 ? null : () => _onPageSelected(1),
              ),
            );

            pageButtons.add(
              IconButton(
                icon: const Icon(Icons.arrow_back),
                color: state.page == 1 ? disabledColor : enabledColor,
                onPressed: state.page == 1
                    ? null
                    : () => _onPageSelected(state.page - 1),
              ),
            );

            if (state.totalPages <= 3) {
              for (int i = 1; i <= state.totalPages; i++) {
                pageButtons.add(PageNumber(
                  onPageSelected: _onPageSelected,
                  number: i,
                  selected: state.page == i,
                ));
              }
            } else {
              if (state.page > 2) {
                pageButtons.add(const Text('...'));
              }

              if (state.page != 1) {
                pageButtons.add(PageNumber(
                    onPageSelected: _onPageSelected, number: state.page - 1));
              }
              pageButtons.add(PageNumber(
                onPageSelected: _onPageSelected,
                number: state.page,
                selected: true,
              ));
              if (constraints.maxWidth > 370 &&
                  state.page != state.totalPages) {
                pageButtons.add(PageNumber(
                    onPageSelected: _onPageSelected, number: state.page + 1));
              }
              if (state.page < state.totalPages - 1) {
                pageButtons.add(const Text('...'));
              }
            }

            pageButtons.add(
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                color: state.page == state.totalPages
                    ? disabledColor
                    : enabledColor,
                onPressed: state.page == state.totalPages
                    ? null
                    : () => _onPageSelected(state.page + 1),
              ),
            );
            pageButtons.add(
              IconButton(
                icon: const Icon(Icons.last_page),
                color: state.page == state.totalPages
                    ? disabledColor
                    : enabledColor,
                onPressed: state.page == state.totalPages
                    ? null
                    : () => _onPageSelected(state.totalPages),
              ),
            );
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pageButtons,
            );
          },
        );
      });
    } else if (_sectionType == SectionType.tv) {
      return LayoutBuilder(builder: (context, constraints) {
        return BlocBuilder<TvBloc, TvState>(
          builder: (context, state) {
            pageButtons.add(
              IconButton(
                icon: const Icon(Icons.first_page),
                color: state.page == 1 ? disabledColor : enabledColor,
                onPressed: state.page == 1 ? null : () => _onPageSelected(1),
              ),
            );

            pageButtons.add(
              IconButton(
                icon: const Icon(Icons.arrow_back),
                color: state.page == 1 ? disabledColor : enabledColor,
                onPressed: state.page == 1
                    ? null
                    : () => _onPageSelected(state.page - 1),
              ),
            );

            if (state.totalPages <= 3) {
              for (int i = 1; i <= state.totalPages; i++) {
                pageButtons.add(PageNumber(
                  onPageSelected: _onPageSelected,
                  number: i,
                  selected: state.page == i,
                ));
              }
            } else {
              if (state.page > 2) {
                pageButtons.add(const Text('...'));
              }

              if (state.page != 1) {
                pageButtons.add(PageNumber(
                    onPageSelected: _onPageSelected, number: state.page - 1));
              }
              pageButtons.add(PageNumber(
                onPageSelected: _onPageSelected,
                number: state.page,
                selected: true,
              ));
              if (constraints.maxWidth > 370 &&
                  state.page != state.totalPages) {
                pageButtons.add(PageNumber(
                    onPageSelected: _onPageSelected, number: state.page + 1));
              }
              if (state.page < state.totalPages - 1) {
                pageButtons.add(const Text('...'));
              }
            }

            pageButtons.add(
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                color: state.page == state.totalPages
                    ? disabledColor
                    : enabledColor,
                onPressed: state.page == state.totalPages
                    ? null
                    : () => _onPageSelected(state.page + 1),
              ),
            );
            pageButtons.add(
              IconButton(
                icon: const Icon(Icons.last_page),
                color: state.page == state.totalPages
                    ? disabledColor
                    : enabledColor,
                onPressed: state.page == state.totalPages
                    ? null
                    : () => _onPageSelected(state.totalPages),
              ),
            );
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pageButtons,
            );
          },
        );
      });
    } else {
      return LayoutBuilder(builder: (context, constraints) {
        return BlocBuilder<BooksBloc, BooksState>(
          builder: (context, state) {
            pageButtons.add(
              IconButton(
                icon: const Icon(Icons.first_page),
                color: state.page == 1 ? disabledColor : enabledColor,
                onPressed: state.page == 1 ? null : () => _onPageSelected(1),
              ),
            );

            pageButtons.add(
              IconButton(
                icon: const Icon(Icons.arrow_back),
                color: state.page == 1 ? disabledColor : enabledColor,
                onPressed: state.page == 1
                    ? null
                    : () => _onPageSelected(state.page - 1),
              ),
            );

            if (state.totalPages <= 3) {
              for (int i = 1; i <= state.totalPages; i++) {
                pageButtons.add(PageNumber(
                  onPageSelected: _onPageSelected,
                  number: i,
                  selected: state.page == i,
                ));
              }
            } else {
              if (state.page > 2) {
                pageButtons.add(const Text('...'));
              }

              if (state.page != 1) {
                pageButtons.add(PageNumber(
                    onPageSelected: _onPageSelected, number: state.page - 1));
              }
              pageButtons.add(PageNumber(
                onPageSelected: _onPageSelected,
                number: state.page,
                selected: true,
              ));
              if (constraints.maxWidth > 370 &&
                  state.page != state.totalPages) {
                pageButtons.add(PageNumber(
                    onPageSelected: _onPageSelected, number: state.page + 1));
              }
              if (state.page < state.totalPages - 1) {
                pageButtons.add(const Text('...'));
              }
            }

            pageButtons.add(
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                color: state.page == state.totalPages
                    ? disabledColor
                    : enabledColor,
                onPressed: state.page == state.totalPages
                    ? null
                    : () => _onPageSelected(state.page + 1),
              ),
            );
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pageButtons,
            );
          },
        );
      });
    }
  }
}
