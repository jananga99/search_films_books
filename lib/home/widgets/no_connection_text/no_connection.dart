import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoConnectionText extends StatelessWidget {
  const NoConnectionText({Key? key}) : super(key: key);

  String getText() {
    return "Oops! It seems there is a problem with your internet connection. Please check your network settings and try again";
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
          const Icon(FontAwesomeIcons.linkSlash, size: 80, color: Colors.grey),
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
