import 'package:flutter/cupertino.dart';

class MovieSection extends StatefulWidget {
  const MovieSection({Key? key}) : super(key: key);

  @override
  State<MovieSection> createState() => _MovieSectionState();
}

class _MovieSectionState extends State<MovieSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Movies',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        // List of movies goes here
      ],
    );
  }
}
