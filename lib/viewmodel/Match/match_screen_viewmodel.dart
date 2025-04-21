import 'package:flutter/cupertino.dart';
import 'package:score_pal/model/Match/match_state.dart';
import 'package:score_pal/model/Team/i_team.dart';
import 'package:score_pal/view/GlobalWidgets/match_widget_decorator.dart';
import 'package:score_pal/viewmodel/ModelsVM/match_viewmodel.dart';

class MatchScreenViewModel extends ChangeNotifier {
  final MatchViewModel _match;

  MatchScreenViewModel(this._match);

  ITeam get team => _match.match.team;

  int get teamScore => _match.match.teamScore;

  int get opponentScore => _match.match.opponentScore;

  MatchState get state => _match.match.state;

  ITeam get opponent => _match.match.opponent;

  DateTime get date => _match.match.date;

  String get address => _match.match.address;

  String get coach => _match.match.coach;

  int get id => _match.match.id;

  bool get isHome => _match.match.isHome;

  MatchViewModel get match => _match;

  Text getStateInterface() {
    var m = MatchWidgetDecorator(_match);
    return m.getStateInterface();
  }
}