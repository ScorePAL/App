import 'package:score_pal/model/Player/positions.dart';

class Player {
  late int _id;
  late String _firstName;
  late String _lastName;
  late DateTime _dateOfBirth;
  late List<Positions> _positions;

  DateTime get dateOfBirth => _dateOfBirth;

  String get firstName => _firstName;

  int get id => _id;

  String get lastName => _lastName;

  List<Positions> get positions => _positions;

  set dateOfBirth(DateTime value) {
    _dateOfBirth = value;
  }

  set firstName(String value) {
    _firstName = value;
  }

  set id(int value) {
    _id = value;
  }

  set lastName(String value) {
    _lastName = value;
  }

  set positions(List<Positions> value) {
    _positions = value;
  }
}
