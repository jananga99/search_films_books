import 'package:flutter/material.dart';
import 'package:ftb/common/enums/enums.dart';

class IdleText extends StatelessWidget {
  final SectionType sectionType;

  const IdleText(this.sectionType, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String text;
    if (sectionType == SectionType.movie) {
      text =
          'The search party is just getting started. Movies are waiting for you to discover them! join in';
    } else if (sectionType == SectionType.tv) {
      text =
          'The search party is just getting started. Tv Series are waiting for you to discover them! join in';
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
            Icons.search,
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
