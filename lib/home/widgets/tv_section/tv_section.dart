import 'package:flutter/cupertino.dart';

class TvSection extends StatefulWidget {
  const TvSection({Key? key}) : super(key: key);

  @override
  State<TvSection> createState() => _TvSectionState();
}

class _TvSectionState extends State<TvSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'TV Series',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        // List of TV series goes here
      ],
    );
  }
}
