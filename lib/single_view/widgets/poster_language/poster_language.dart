import 'package:flutter/cupertino.dart';

import '../../../common/helpers/single_view_helpers.dart';

class PosterLanguage extends StatelessWidget {
  final String? _language;
  final String _suffix;
  const PosterLanguage(
      {Key? key, required String? language, required String suffix})
      : _language = language,
        _suffix = suffix,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(
        "Language$_suffix${_language == null || _language!.isEmpty ? 'Unknown' : SingleViewHelper.getLanguageName(_language!)}",
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
