import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mobile_app/model/Lang/language.dart';

class Francais implements Language {
  final Map<String, String> _translations = {};

  Francais() {
    load();
  }

  Future<void> load() async {
    final String jsonString = await rootBundle.loadString('assets/lang/fr_FR.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    _translations.clear();
    _translations.addAll(jsonMap.map((key, value) => MapEntry(key, value.toString())));
  }

  @override
  String getLabel() {
    return "Francais";
  }

  @override
  String getMessage(String key) {
    if (_translations[key] != null) {
      return _translations[key]!;
    }
    return "Message introuvable";
  }

}