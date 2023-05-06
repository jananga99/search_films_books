import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Icon(
                      Icons.search,
                      size: 80,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'The search party is just getting started. Movies are waiting for you to discover them! join in',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: _moviesBloc.state.status == MoviesStatus.loading,
              child: Column(
                children: const [
                  SizedBox(height: 225),
                  Center(
                    child: CircularProgressIndicator(
                      color: Color(0xff005c99),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: _moviesBloc.state.status == MoviesStatus.succeeded &&
                  _moviesBloc.state.movies.isEmpty,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Icon(
                      Icons.sentiment_neutral,
                      size: 80,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Hmm, seems like we couldn't find any movies with that name. Don't worry, try again with a different name, and let's make some movie magic happen.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
                visible: _moviesBloc.state.status == MoviesStatus.succeeded &&
                    state.movies.isNotEmpty,
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
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Icon(FontAwesomeIcons.faceSadTear,
                        size: 80, color: Colors.red),
                    const SizedBox(height: 16),
                    Text(
                      "Oops! Something went wrong. Don't worry, it's not your fault. Please try again, or contact me if the problem persists.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
