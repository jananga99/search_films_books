import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ftb/single_view/widget/original_title/original_title.dart';
import 'package:ftb/single_view/widget/poster_language/poster_language.dart';
import 'package:ftb/single_view/widget/poster_release/poster_release.dart';

import '../../../common/models/tv_models/tv.dart';
import '../../../header_bar/view/header_bar.dart';
import '../../widget/poster/poster.dart';
import '../../widget/poster_overview/poster_overview.dart';
import '../../widget/poster_title/poster_title.dart';
import '../../widget/vote_indicator/vote_indicator.dart';

class TvPage extends StatelessWidget {
  final Tv _tv;
  final String imageUrl = dotenv.env['IMAGE_URL']!;
  TvPage({Key? key, required Tv tv})
      : _tv = tv,
        super(key: key);

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
              Poster(_tv.posterPath),
              const SizedBox(height: 16),
              PosterTitle(_tv.name),
              Visibility(
                visible: _tv.name != _tv.originalName,
                child: OriginalTitle(_tv.originalName),
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
                        PosterRelease(_tv.firstAirDate),
                        PosterLanguage(_tv.originalLanguage)
                      ],
                    ),
                    VoteIndicator(_tv.voteAverage)
                  ],
                ),
              ),
              PosterOverview(_tv.overview)
            ],
          ),
        ),
      ),
    );
  }
}
