import 'package:flutter/cupertino.dart';

class OriginalTitle extends StatelessWidget {
  final String originalTitle;
  const OriginalTitle(this.originalTitle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        '($originalTitle)',
        style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
