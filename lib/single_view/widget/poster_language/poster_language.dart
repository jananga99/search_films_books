import 'package:flutter/cupertino.dart';

import '../../../common/helpers/single_view_helpers.dart';

class PosterLanguage extends StatelessWidget {
  final String? language;
  const PosterLanguage(this.language, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(
        "Language        :    ${language == null || language!.isEmpty ? 'Unknown' : SingleViewHelper.getLanguageName(language!)}",
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
