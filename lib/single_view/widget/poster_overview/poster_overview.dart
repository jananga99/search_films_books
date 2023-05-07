import 'package:flutter/cupertino.dart';

class PosterOverview extends StatelessWidget {
  final String overview;
  const PosterOverview(this.overview, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        overview,
        style: const TextStyle(fontSize: 18.0),
      ),
    );
  }
}
