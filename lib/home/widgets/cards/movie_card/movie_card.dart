import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

import '../../../../common/logger/logger.dart';
import '../../../../common/models/movie_models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie _movie;
  final String imageUrl = dotenv.env['IMAGE_URL']!;

  MovieCard(Movie movie, {super.key}) : _movie = movie;

  String? getReleaseYear() {
    try {
      return DateFormat('yyyy').format(DateTime.parse(_movie.releaseDate!));
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final String? releaseYear = getReleaseYear();
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
              child: AspectRatio(
                  aspectRatio: 2 / 3,
                  child: _movie.posterPath != null
                      ? CachedNetworkImage(
                          imageUrl: imageUrl + _movie.posterPath!,
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
            Expanded(
              flex: constraints.maxWidth < 125 ? 2 : 1,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _movie.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      releaseYear ?? 'Unknown',
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
