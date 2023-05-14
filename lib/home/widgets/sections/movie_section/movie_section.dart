import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftb/common/constants/route_constants.dart';
import 'package:ftb/common/enums/enums.dart';
import 'package:ftb/home/widgets/idle_text/idle_text.dart';
import 'package:ftb/home/widgets/no_connection_text/no_connection.dart';
import 'package:ftb/home/widgets/paging_row/paging_row.dart';

import '../../../../common/constants/message_constants.dart';
import '../../../../common/models/movie_models/movie.dart';
import '../../../bloc/movies_bloc/movies_bloc.dart';
import '../../cards/movie_card/movie_card.dart';
import '../../empty_text/empty_text.dart';
import '../../error_text/error_text.dart';
import '../../loader/home_page_loader.dart';

class MovieSection extends StatefulWidget {
  const MovieSection({Key? key, required void Function(int) onPageSelected})
      : _onPageSelected = onPageSelected,
        super(key: key);
  final void Function(int) _onPageSelected;

  @override
  State<MovieSection> createState() => _MovieSectionState();
}

class _MovieSectionState extends State<MovieSection> {
  late MoviesBloc _moviesBloc;

  @override
  Widget build(BuildContext context) {
    void handleCardTap(Movie movie) {
      Navigator.of(context)
          .pushNamed(RouteConstants.movieRoute, arguments: movie);
    }

    return LayoutBuilder(builder: (context, constraints) {
      return BlocBuilder<MoviesBloc, MoviesState>(
        buildWhen: (prev, current) => prev != current,
        builder: (context, state) {
          _moviesBloc = context.read<MoviesBloc>();
          return Column(
            children: [
              Visibility(
                visible: _moviesBloc.state.status == MoviesStatus.idle,
                child: const IdleText(SectionType.movie),
              ),
              Visibility(
                visible: _moviesBloc.state.status == MoviesStatus.loading,
                child: const HomePageLoader(SectionType.movie),
              ),
              Visibility(
                visible: _moviesBloc.state.status == MoviesStatus.succeeded &&
                    _moviesBloc.state.movies.isEmpty,
                child: const EmptyText(SectionType.movie),
              ),
              Visibility(
                  visible: _moviesBloc.state.status == MoviesStatus.succeeded &&
                      state.movies.isNotEmpty,
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
                        children: state.movies
                            .map((movie) => GestureDetector(
                                onTap: () => handleCardTap(movie),
                                child: MovieCard(movie)))
                            .toList(),
                      ),
                      Visibility(
                        visible: _moviesBloc.state.totalPages > 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PagingRow(
                            onPageSelected: widget._onPageSelected,
                            sectionType: SectionType.movie,
                          ),
                        ),
                      )
                    ],
                  )),
              Visibility(
                visible: _moviesBloc.state.status == MoviesStatus.failed,
                child: _moviesBloc.state.error == Messages.connectionError
                    ? const NoConnectionText()
                    : const ErrorText(SectionType.movie),
              ),
            ],
          );
        },
      );
    });
  }
}
