import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

import '../../../../common/logger/logger.dart';
import '../../../../common/models/tv_models/tv.dart';

class TvCard extends StatelessWidget {
  final Tv _tv;
  final String imageUrl = dotenv.env['IMAGE_URL']!;

  TvCard(Tv tv, {super.key}) : _tv = tv;

  String? getFirstAirYear() {
    try {
      return DateFormat('yyyy').format(DateTime.parse(_tv.firstAirDate!));
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final String? releaseYear = getFirstAirYear();
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
                    child: _tv.posterPath != null
                        ? CachedNetworkImage(
                            imageUrl: imageUrl + _tv.posterPath!,
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
                      _tv.name,
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
