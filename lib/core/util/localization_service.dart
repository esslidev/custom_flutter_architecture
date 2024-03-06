import 'dart:convert';
import 'dart:ui';

import 'package:flutter/services.dart';

class LocalizationService {
  static final LocalizationService _instance = LocalizationService._internal();
  late Map<String, dynamic> _localizedStrings;

  factory LocalizationService() {
    return _instance;
  }

  LocalizationService._internal();

  static Future<LocalizationService> load(Locale locale) async {
    final localizationService = LocalizationService._internal();
    String filePath = 'assets/translations/${locale.languageCode}.json';
    print("File Path: $filePath");

    try {
      String jsonContent = await rootBundle.loadString(filePath);

      localizationService._localizedStrings =
          Map<String, dynamic>.from(json.decode(jsonContent));
    } catch (e) {
      print("Error loading JSON: $e");
    }

    return localizationService;
  }

  String translate(String key) {
    // For nested keys, you can split them and navigate through the structure
    List<String> keyParts = key.split('.');
    dynamic current = _localizedStrings;

    for (var part in keyParts) {
      if (current is Map<String, dynamic> && current.containsKey(part)) {
        current = current[part];
      } else {
        // If the key is not found, return the key itself
        return key;
      }
    }

    // Return the final translation or the key itself if not found
    return current ?? key;
  }
}
