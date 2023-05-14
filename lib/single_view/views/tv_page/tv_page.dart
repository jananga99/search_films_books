import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../common/models/tv_models/tv.dart';
import '../../../header_bar/view/header_bar.dart';
import '../../widgets/original_title/original_title.dart';
import '../../widgets/poster/poster.dart';
import '../../widgets/poster_language/poster_language.dart';
import '../../widgets/poster_overview/poster_overview.dart';
import '../../widgets/poster_release/poster_release.dart';
import '../../widgets/poster_title/poster_title.dart';
import '../../widgets/vote_indicator/vote_indicator.dart';

class TvPage extends StatelessWidget {
  final Tv _tv;
  final String imageUrl = dotenv.env['IMAGE_URL']!;
  TvPage({Key? key, required Tv tv})
      : _tv = tv,
        super(key: key);

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
          SliverFillRemaining(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderBar(),
                  _tv.posterPath == null
                      ? const SizedBox()
                      : Poster(imageUrl + _tv.posterPath!),
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
                        Expanded(
                            child: VoteIndicator(
                          voteAverage: _tv.voteAverage,
                          total: 10,
                        ))
                      ],
                    ),
                  ),
                  PosterOverview(_tv.overview)
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
