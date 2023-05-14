import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ftb/header_bar/view/header_bar.dart';

import '../../../common/models/movie_models/movie.dart';
import '../../widgets/original_title/original_title.dart';
import '../../widgets/poster/poster.dart';
import '../../widgets/poster_language/poster_language.dart';
import '../../widgets/poster_overview/poster_overview.dart';
import '../../widgets/poster_release/poster_release.dart';
import '../../widgets/poster_title/poster_title.dart';
import '../../widgets/vote_indicator/vote_indicator.dart';

class MoviePage extends StatelessWidget {
  final Movie _movie;
  final String imageUrl = dotenv.env['IMAGE_URL']!;
  MoviePage({super.key, required Movie movie}) : _movie = movie;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).colorScheme.background,
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: CustomScrollView(slivers: [
          const SliverToBoxAdapter(
            child: HeaderBar(),
          ),
          SliverFillRemaining(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _movie.posterPath == null
                      ? const SizedBox()
                      : Poster(imageUrl + _movie.posterPath!),
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
                        Expanded(
                            child: VoteIndicator(
                                voteAverage: _movie.voteAverage, total: 10))
                      ],
                    ),
                  ),
                  PosterOverview(_movie.overview)
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
