import 'package:architect_hub/ressources/enums/languages.dart';
import 'package:flutter/material.dart';

const String arabic = "ar";
const String english = "en";
const String assetPath = "assets/translations";

const Locale arabicLocal = Locale("ar", "SA");
const Locale englishLocal = Locale("en", "US");

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.english:
        return english;
      case LanguageType.arabic:
        return arabic;
    }
  }
}
