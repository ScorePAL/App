import 'package:flutter/cupertino.dart';
import 'package:score_pal/model/Match/i_match.dart';
import 'package:score_pal/model/Match/match.dart';
import 'package:score_pal/model/Match/match_state.dart';
import 'package:score_pal/model/Played/played.dart';
import 'package:score_pal/model/Player/player.dart';
import 'package:score_pal/model/Player/positions.dart';
import 'package:score_pal/model/Team/i_team.dart';
import 'package:score_pal/viewmodel/ModelsVM/user_viewmodel.dart';
import 'package:score_pal/viewmodel/ModelsVM/match_viewmodel.dart';
import 'package:score_pal/model/Team/team.dart';

class HomeViewModel extends ChangeNotifier {
  final UserViewModel _user;
  late List<MatchViewModel> _matches;

  HomeViewModel(this._user) {
    IMatch match = Match();
    ITeam team = Team();
    team.name = "USRF A";
    team.logo = "assets/images/teams/logo.png";

    ITeam opponent = Team();
    opponent.name = "Chagny";
    opponent.logo = "assets/images/teams/opponent_logo.png";

    match.team = team;
    match.opponent = opponent;
    match.teamScore = 4;
    match.opponentScore = 2;

    match.state = MatchState.firstHalf;
    match.date = DateTime.now();
    match.address = "Stade des pommiers";
    match.coach = "Jean Dupont";

    match.formation = "4-4-2";

    Player player = Player();
    player.firstName = "John";
    player.lastName = "Doe";
    player.dateOfBirth = DateTime(1990, 1, 1);

    match.lineup = [];

    for (int i = 0; i < 18; i++) {
      Played played = Played();
      played.player = player;
      played.jerseyNumber = i + 1;

      if (i == 1) {
        played.position = Positions.goalkeeper;
      }
      if (i == 2 || i == 3) {
        played.position = Positions.wingback;
      }
      if (i == 4 || i == 5) {
        played.position = Positions.centerback;
      }
      if (i == 6 || i == 8) {
        played.position = Positions.defensiveMidfielder;
      }
      if (i == 11 || i == 9) {
        played.position = Positions.centerForward;
      }
      if (i == 10 || i == 7) {
        played.position = Positions.offensiveMidfielder;
      } else {
        played.position = Positions.centerback;
      }

      match.lineup.add(played);
    }

    _matches = [MatchViewModel(match), MatchViewModel(match), MatchViewModel(match)];
  }

  UserViewModel get user => _user;

  List<MatchViewModel> get match => _matches;

  String get getUsername => user.getUsername;

  getMatch(int i) {
    return _matches[i];
  }
}