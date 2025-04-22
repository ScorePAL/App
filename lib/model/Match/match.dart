import 'package:score_pal/model/Match/i_match.dart';
import 'package:score_pal/model/Played/played.dart';
import 'package:score_pal/model/Match/match_state.dart';

import '../Team/i_team.dart';

class Match with IMatch {
  late int _id;
  late ITeam _team;
  late ITeam _opponent;
  late int _teamScore;
  late int _opponentScore;
  late String _address;
  late DateTime _date;
  late bool _isHome;
  late String _coach;
  late MatchState _state;
  late List<Played> _lineup;
  late String _formation;

  @override
  int get id => _id;

  @override
  set id(int value) {
    _id = value;
  }

  @override
  ITeam get team => _team;

  @override
  set team(ITeam value) {
    _team = value;
  }

  @override
  ITeam get opponent => _opponent;

  @override
  set opponent(ITeam value) {
    _opponent = value;
  }

  @override
  int get teamScore => _teamScore;

  @override
  set teamScore(int value) {
    _teamScore = value;
  }

  @override
  int get opponentScore => _opponentScore;

  @override
  set opponentScore(int value) {
    _opponentScore = value;
  }

  @override
  String get address => _address;

  @override
  set address(String value) {
    _address = value;
  }

  @override
  DateTime get date => _date;

  @override
  set date(DateTime value) {
    _date = value;
  }

  @override
  bool get isHome => _isHome;

  @override
  set isHome(bool value) {
    _isHome = value;
  }

  @override
  String get coach => _coach;

  @override
  set coach(String value) {
    _coach = value;
  }

  @override
  MatchState get state => _state;

  @override
  set state(MatchState value) {
    _state = value;
  }

  @override
  List<Played> get lineup => _lineup;

  @override
  set lineup(List<Played> value) {
    _lineup = value;
  }

  @override
  String get formation => _formation;

  @override
  set formation(String value) {
    _formation = value;
  }
}
