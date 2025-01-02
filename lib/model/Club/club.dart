import 'package:mobile_app/model/Club/i_club.dart';

class Club with IClub {
  late int _clubId;
  late String _name;
  late String _logoUrl;

  @override
  int get id => _clubId;

  @override
  String get logoUrl => _logoUrl;

  @override
  // TODO: implement name
  String get name => _name;

  @override
  set id(int id) {
    _clubId = id;
  }

  @override
  set logoUrl(String logoUrl) {
    _logoUrl = logoUrl;
  }

  @override
  set name(String name) {
    _name = name;
  }
}