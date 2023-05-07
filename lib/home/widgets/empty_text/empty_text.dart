import 'package:flutter/material.dart';
import 'package:ftb/common/enums/enums.dart';

class EmptyText extends StatelessWidget {
  final SectionType sectionType;
  const EmptyText(this.sectionType, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String text;
    if (sectionType == SectionType.movie) {
      text =
          "Hmm, seems like we couldn't find any movies with that name. Don't worry, try again with a different name, and let's make some movie magic happen.";
    } else if (sectionType == SectionType.tv) {
      text =
          "Hmm, seems like we couldn't find any tv series with that name. Don't worry, try again with a different name, and let's make some tv series magic happen.";
    } else {
      text = '';
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          const Icon(
            Icons.sentiment_neutral,
            size: 80,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
