import 'package:score_pal/model/Lang/language.dart';

import '../Club/club.dart';
import '../Lang/language_factory.dart';
import 'role.dart';

class User {
  final String _firstName;
  final String _lastName;
  final int _age;
  final Role _role;
  final Club _relatedTo;
  late Language lang;

  User(this._firstName, this._lastName, this._age, this._role, this._relatedTo, String lang) {
    var lf = LanguageFactory();
    this.lang = lf.getLanguage(lang);
  }

  String getUsername() {
    return "$_firstName $_lastName";
  }

  Club get relatedTo => _relatedTo;

  Language get language => lang;
}
