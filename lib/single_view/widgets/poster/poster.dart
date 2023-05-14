import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../common/logger/logger.dart';

class Poster extends StatelessWidget {
  final String posterPath;
  const Poster(this.posterPath, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: CachedNetworkImage(
          imageUrl: posterPath,
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: CircularProgressIndicator(value: downloadProgress.progress),
          ),
          errorWidget: (context, url, error) {
            logger.e(error);
            return const Icon(Icons.error);
          },
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height * 0.8,
          width: double.infinity,
        ),
      ),
    );
  }
}
