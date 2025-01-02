import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mobile_app/model/Lang/language.dart';

class English implements Language {
  final Map<String, String> _translations = {};

  English() {
    load();
  }

  Future<void> load() async {
    final String jsonString = await rootBundle.loadString('assets/lang/en_US.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    _translations.clear();
    _translations.addAll(jsonMap.map((key, value) => MapEntry(key, value.toString())));
  }

  @override
  String getLabel() {
    return "English";
  }

  @override
  String getMessage(String key) {
    if (_translations[key] != null) {
      return _translations[key]!;
    }
    return "Message not found";
  }

}