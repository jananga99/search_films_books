import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../common/enums/enums.dart';

class ErrorText extends StatelessWidget {
  final SectionType sectionType;
  const ErrorText(this.sectionType, {Key? key}) : super(key: key);

  String getText() {
    final String text;
    if (sectionType == SectionType.movie) {
      text =
          "Oops! Something went wrong. Don't worry, it's not your fault. Please try again, or contact me if the problem persists.";
    } else if (sectionType == SectionType.tv) {
      text =
          "Oops! Something went wrong. Don't worry, it's not your fault. Please try again, or contact me if the problem persists.";
    } else {
      text = '';
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          const Icon(FontAwesomeIcons.faceSadTear, size: 80, color: Colors.red),
          const SizedBox(height: 16),
          Text(
            getText(),
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
