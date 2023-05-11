import 'package:flutter/material.dart';

import '../../../common/models/book_models/book.dart';
import '../../../header_bar/view/header_bar.dart';
import '../../widget/poster/poster.dart';
import '../../widget/poster_authors/poster_authors.dart';
import '../../widget/poster_language/poster_language.dart';
import '../../widget/poster_overview/poster_overview.dart';
import '../../widget/poster_publish_date/poster_publish_date.dart';
import '../../widget/poster_publisher/poster_publisher.dart';
import '../../widget/poster_title/poster_title.dart';
import '../../widget/vote_indicator/vote_indicator.dart';

class BookPage extends StatelessWidget {
  final Book _book;

  const BookPage({Key? key, required Book book})
      : _book = book,
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
              Visibility(
                  visible: _book.imageUrl != null,
                  child: Poster(_book.imageUrl ?? '')),
              const SizedBox(height: 16),
              PosterTitle(_book.title),
              Visibility(
                  visible: _book.authors.isNotEmpty,
                  child: Row(
                    children: [
                      PosterAuthors(_book.authors),
                    ],
                  )),
              Visibility(
                  visible: _book.publisher != null,
                  child: PosterPublisher(_book.publisher)),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PosterLanguage(_book.language),
                        PosterPublishDate(_book.publishedDate)
                      ],
                    ),
                    Expanded(
                        child: VoteIndicator(
                      voteAverage: _book.averageRating,
                      total: 5,
                    ))
                  ],
                ),
              ),
              PosterOverview(_book.description ?? '')
            ],
          ),
        ),
      ),
    );
  }
}
