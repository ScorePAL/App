import 'package:flutter/cupertino.dart';
import 'package:score_pal/model/Match/i_match.dart';
import 'package:score_pal/model/Match/match_state.dart';
import 'package:score_pal/model/Team/i_team.dart';
import 'package:score_pal/view/GlobalWidgets/match_widget_decorator.dart';

class MatchScreenViewModel extends ChangeNotifier {
  final IMatch _match;

  MatchScreenViewModel(this._match);

  ITeam get team => _match.team;

  int get teamScore => _match.teamScore;

  int get opponentScore => _match.opponentScore;

  MatchState get state => _match.state;

  ITeam get opponent => _match.opponent;

  DateTime get date => _match.date;

  String get address => _match.address;

  String get coach => _match.coach;

  int get id => _match.id;

  bool get isHome => _match.isHome;

  IMatch get match => _match;

  Text getStateInterface() {
    var m = MatchWidgetDecorator(_match);
    return m.getStateInterface();
  }
}