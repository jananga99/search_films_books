import 'package:flutter/material.dart';
import 'package:ftb/header_bar/view/header_bar.dart';
import 'package:ftb/single_view/widget/poster/poster.dart';
import 'package:ftb/single_view/widget/poster_overview/poster_overview.dart';
import 'package:ftb/single_view/widget/poster_release/poster_release.dart';
import 'package:ftb/single_view/widget/vote_indicator/vote_indicator.dart';

import '../../../common/models/movie_models/movie.dart';
import '../../widget/original_title/original_title.dart';
import '../../widget/poster_language/poster_language.dart';
import '../../widget/poster_title/poster_title.dart';

class MoviePage extends StatelessWidget {
  final Movie _movie;

  const MoviePage({super.key, required Movie movie}) : _movie = movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderBar(),
              Poster(_movie.posterPath),
              const SizedBox(height: 16),
              PosterTitle(_movie.title),
              Visibility(
                visible: _movie.title != _movie.originalTitle,
                child: OriginalTitle(_movie.originalTitle),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PosterRelease(_movie.releaseDate),
                        PosterLanguage(_movie.originalLanguage)
                      ],
                    ),
                    VoteIndicator(_movie.voteAverage)
                  ],
                ),
              ),
              PosterOverview(_movie.overview)
            ],
          ),
        ),
      ),
    );
  }
}
