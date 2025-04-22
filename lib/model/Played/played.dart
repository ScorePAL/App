import 'package:score_pal/model/Played/assist.dart';
import 'package:score_pal/model/Played/penalty.dart';
import 'package:score_pal/model/Player/player.dart';
import 'package:score_pal/model/Player/positions.dart';

class Played {
  late int _id;
  late Player _player;
  late Positions _position;
  late bool _isCaptain;
  late bool _isInjured;
  late bool _redCard;
  late bool _yellowCard;
  late int _offTargetShots;
  late int _onTargetShots;
  late int _blockedShots;
  late int _goals;
  late int _exitTime;
  late int _entryTime;
  late int _jerseyNumber;
  late List<Penalty> _penalties = [];
  late List<Assist> _assists = [];
  late Match _match;

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  Player get player => _player;

  set player(Player value) {
    _player = value;
  }

  Positions get position => _position;

  set position(Positions value) {
    _position = value;
  }

  bool get isCaptain => _isCaptain;

  set isCaptain(bool value) {
    _isCaptain = value;
  }

  bool get isInjured => _isInjured;

  set isInjured(bool value) {
    _isInjured = value;
  }

  bool get redCard => _redCard;

  set redCard(bool value) {
    _redCard = value;
  }

  bool get yellowCard => _yellowCard;

  set yellowCard(bool value) {
    _yellowCard = value;
  }

  int get offTargetShots => _offTargetShots;

  set offTargetShots(int value) {
    _offTargetShots = value;
  }

  int get onTargetShots => _onTargetShots;

  set onTargetShots(int value) {
    _onTargetShots = value;
  }

  int get blockedShots => _blockedShots;

  set blockedShots(int value) {
    _blockedShots = value;
  }

  int get goals => _goals;

  set goals(int value) {
    _goals = value;
  }

  int get exitTime => _exitTime;

  set exitTime(int value) {
    _exitTime = value;
  }

  int get entryTime => _entryTime;

  set entryTime(int value) {
    _entryTime = value;
  }

  int get jerseyNumber => _jerseyNumber;

  set jerseyNumber(int value) {
    _jerseyNumber = value;
  }

  List<Penalty> get penalties => _penalties;

  set penalties(List<Penalty> value) {
    _penalties = value;
  }

  List<Assist> get assists => _assists;

  set assists(List<Assist> value) {
    _assists = value;
  }

  Match get match => _match;

  set match(Match value) {
    _match = value;
  }
}