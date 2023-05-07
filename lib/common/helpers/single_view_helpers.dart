import 'package:flutter/material.dart';

import '../constants/language_constants.dart';

class SingleViewHelper {
  static Color getRatingColor(double? rating) {
    if (rating == null) {
      return Colors.grey;
    }
    final Color color;
    if (rating >= 7.5) {
      color = Colors.green;
    } else if (rating >= 5.5) {
      color = Colors.yellow;
    } else if (rating >= 3) {
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
