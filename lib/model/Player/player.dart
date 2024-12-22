import 'package:mobile_app/model/Player/i_player.dart';
import 'package:mobile_app/model/Player/positions.dart';

class Player with IPlayer {
  late int _id;
  late String _firstName;
  late String _lastName;
  late DateTime _dateOfBirth;
  late List<Positions> _positions;

  @override
  DateTime get dateOfBirth => _dateOfBirth;

  @override
  String get firstName => _firstName;

  @override
  int get id => _id;

  @override
  String get lastName => _lastName;

  @override
  List<Positions> get positions => _positions;

  @override
  set dateOfBirth(DateTime value) {
    _dateOfBirth = value;
  }

  @override
  set firstName(String value) {
    _firstName = value;
  }

  @override
  set id(int value) {
    _id = value;
  }

  @override
  set lastName(String value) {
    _lastName = value;
  }

  @override
  set positions(List<Positions> value) {
    _positions = value;
  }
}
