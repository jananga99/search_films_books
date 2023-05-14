import 'package:flutter/cupertino.dart';

class PosterRelease extends StatelessWidget {
  final String? releaseDate;
  const PosterRelease(this.releaseDate, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(
        "Release Date  :    ${releaseDate == null || releaseDate!.isEmpty ? 'Unknown' : releaseDate}",
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
