import 'i_team.dart';

class Team with ITeam {
  late int _fffId;
  late String _name;
  late String _logo;

  @override
  int get fffId => _fffId;

  @override
  set fffId(int value) {
    _fffId = value;
  }

  @override
  String get name => _name;

  @override
  set name(String value) {
    _name = value;
  }

  @override
  String get logo => _logo;

  @override
  set logo(String value) {
    _logo = value;
  }
}