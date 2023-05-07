import 'package:flutter/material.dart';
import 'package:ftb/common/enums/enums.dart';

class HomePageLoader extends StatelessWidget {
  final SectionType sectionType;
  const HomePageLoader(this.sectionType, {Key? key}) : super(key: key);

  String getText() {
    final String text;
    if (sectionType == SectionType.movie) {
      text = "Hold on tight! We're searching for your movies.";
    } else if (sectionType == SectionType.tv) {
      text = "Hold on tight! We're searching for your tv series.";
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
          const CircularProgressIndicator(
            color: Color(0xff005c99),
          ),
          const SizedBox(height: 20),
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
