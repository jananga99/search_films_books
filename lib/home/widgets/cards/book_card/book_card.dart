import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../common/logger/logger.dart';
import '../../../../common/models/book_models/book.dart';

class BookCard extends StatelessWidget {
  final Book _book;

  const BookCard(Book book, {super.key}) : _book = book;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      color: const Color(0xff66c2ff),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: AspectRatio(
                    aspectRatio: 2 / 3,
                    child: _book.imageUrl != null
                        ? CachedNetworkImage(
                            imageUrl: _book.imageUrl!,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                  value: downloadProgress.progress),
                            ),
                            errorWidget: (context, url, error) {
                              logger.e(error);
                              return const Icon(Icons.error);
                            },
                            fit: BoxFit.cover,
                          )
                        : const Icon(Icons.error)),
              ),
            ),
            Expanded(
              flex: constraints.maxWidth < 125 ? 2 : 1,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _book.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _book.authors.isEmpty ? 'Unknown' : _book.authors[0],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
