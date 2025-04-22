import 'package:flutter/material.dart';
import 'package:score_pal/model/Data/match_repository.dart';
import 'package:score_pal/model/api_client.dart';
import 'package:score_pal/view/GlobalWidgets/match_widget_decorator.dart';
import 'package:score_pal/viewmodel/ModelsVM/match_viewmodel.dart';
import 'package:score_pal/model/Team/i_team.dart';
import 'package:score_pal/model/Match/match_state.dart';
import 'package:score_pal/view/LiveMatch/match_screen.dart';

class HomeScreenMatchWidgetViewModel extends ChangeNotifier {
  final MatchWidgetDecorator _match;
  final MatchRepository _repository = MatchRepository(ApiClient('http://localhost:3000'));

  HomeScreenMatchWidgetViewModel(this._match);

  MatchViewModel get match => _match.match;

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

  set address(String value) {
    _match.address = value;
  }

  set date(DateTime value) {
    _match.date = value;
  }

  set opponent(ITeam value) {
    _match.opponent = value;
  }

  set opponentScore(int value) {
    _match.opponentScore = value;
  }

  set state(MatchState value) {
    _match.state = value;
  }

  set team(ITeam value) {
    _match.team = value;
  }

  set teamScore(int value) {
    _match.teamScore = value;
  }

  set coach(String value) {
    _match.coach = value;
  }

  set id(int value) {
    _match.id = value;
  }

  set isHome(bool value) {
    _match.isHome = value;
  }

  Text getStateInterface() {
    var m = MatchWidgetDecorator(_match.match);
    return m.getStateInterface();
  }

  void updateTeamScore(int score) {
    _match.teamScore = score;
    notifyListeners();
  }

  void updateOpponentScore(int score) {
    _match.opponentScore = score;
    notifyListeners();
  }

  Future<void> updateMatchScore() async {
    try {
      await _repository.updateScore(_match.match.match);

      notifyListeners();
    } catch (e) {
      // Gérer les erreurs ici (log ou affichage d'un message à l'utilisateur)
      throw Exception('Error updating match score: $e');
    }
  }

  void displayMatch(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MatchScreen(match: _match.match)),
    );
  }
}