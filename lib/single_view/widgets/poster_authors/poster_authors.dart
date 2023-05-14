import 'package:flutter/cupertino.dart';

class PosterAuthors extends StatelessWidget {
  final List<String> authors;
  const PosterAuthors(this.authors, {Key? key}) : super(key: key);

  String getAuthorsText() {
    String text = '';
    if (authors.isNotEmpty) {
      if (authors.length == 1) {
        text = authors[0];
      } else if (authors.length == 2) {
        text = '${authors[0]} & ${authors[1]}';
      } else {
        for (int i = 0; i < authors.length - 1; i++) {
          text += '${authors[i]}, ';
        }
        text += ' & ${authors[authors.length - 1]}';
      }
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          "By ${getAuthorsText()}",
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
