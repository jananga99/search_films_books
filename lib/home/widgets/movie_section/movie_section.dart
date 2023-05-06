import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/movies_bloc/movies_bloc.dart';
import 'movie_cards/movie_card.dart';

class MovieSection extends StatefulWidget {
  const MovieSection({Key? key}) : super(key: key);

  @override
  State<MovieSection> createState() => _MovieSectionState();
}

class _MovieSectionState extends State<MovieSection> {
  late MoviesBloc _moviesBloc;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (prev, current) => prev != current,
      builder: (context, state) {
        _moviesBloc = context.read<MoviesBloc>();
        return Column(
          children: [
            Visibility(
              visible: _moviesBloc.state.status == MoviesStatus.idle,
              child: const Text("Search to see your films"),
            ),
            Visibility(
              visible: _moviesBloc.state.status == MoviesStatus.loading,
              child: const CircularProgressIndicator(
                color: Colors.red,
              ),
            ),
            Visibility(
                visible: _moviesBloc.state.status == MoviesStatus.succeeded,
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.4,
                  padding: const EdgeInsets.all(16),
                  children:
                      state.movies.map((movie) => MovieCard(movie)).toList(),
                )),
            Visibility(
                visible: _moviesBloc.state.status == MoviesStatus.failed,
                child: const Text("Failed Movie")),
          ],
        );
      },
    );
  }
}
