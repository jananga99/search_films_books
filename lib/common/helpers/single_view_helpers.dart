import 'package:flutter/material.dart';

import '../constants/language_constants.dart';

class SingleViewHelper {
  static Color getRatingColor({required double rating, required double total}) {
    final Color color;
    final double percent = rating / total * 100;
    if (percent >= 75) {
      color = Colors.green;
    } else if (percent >= 55) {
      color = Colors.yellow;
    } else if (percent >= 30) {
      color = Colors.deepOrange;
    } else {
      color = Colors.red;
    }
    return color;
  }

  static String getLanguageName(String language) {
    return LanguageConstants.languageNames[language] ?? "unknown";
  }
}
