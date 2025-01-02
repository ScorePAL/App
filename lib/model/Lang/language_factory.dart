import 'Implementation/english.dart';
import 'Implementation/francais.dart';
import 'language.dart';

class LanguageFactory {
  Map<String, Language> _languages = {};

  LanguageFactory() {
    _initialise();
  }

  _initialise() {
    // Add all the languages here
    _languages = {
      'fr_FR': Francais(),
      'en_US': English(),
    };
  }

  Language getLanguage(String language) {
    if (_languages.containsKey(language)) {
      return _languages[language]!;
    } else {
      return _languages['fr']!;
    }
  }
}