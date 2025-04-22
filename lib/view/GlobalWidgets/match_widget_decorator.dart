import 'package:flutter/material.dart';
import 'package:score_pal/model/Match/match_state.dart';
import 'package:score_pal/model/Played/played.dart';
import 'package:score_pal/model/Team/i_team.dart';
import 'package:score_pal/viewmodel/ModelsVM/match_viewmodel.dart';

import '../../../app/app_colors.dart';

class MatchWidgetDecorator {
  final MatchViewModel match;

  MatchWidgetDecorator(this.match);

  ITeam get team => match.match.team;

  int get teamScore => match.match.teamScore;

  int get opponentScore => match.match.opponentScore;

  MatchState get state => match.match.state;

  ITeam get opponent => match.match.opponent;

  DateTime get date => match.match.date;

  String get address => match.match.address;

  String get coach => match.match.coach;

  int get id => match.match.id;

  bool get isHome => match.match.isHome;

  set address(String value) {
    match.match.address = value;
  }

  set date(DateTime value) {
    match.match.date = value;
  }

  set opponent(ITeam value) {
    match.match.opponent = value;
  }

  set opponentScore(int value) {
    match.match.opponentScore = value;
  }

  set state(MatchState value) {
    match.match.state = value;
  }

  set team(ITeam value) {
    match.match.team = value;
  }

  set teamScore(int value) {
    match.match.teamScore = value;
  }

  set coach(String value) {
    match.match.coach = value;
  }

  set id(int value) {
    match.match.id = value;
  }

  set isHome(bool value) {
    match.match.isHome = value;
  }

  Text getStateInterface() {
    String value = "";
    Color textColor = AppColors.textColor;

    switch (state) {
      case MatchState.notStarted:
        value = date.toString();
        break;
      case MatchState.firstHalf:
        value = "🎥 45'";
        textColor = AppColors.secondaryColor;
        break;
      case MatchState.secondHalf:
        value = "🎥 90'";
        textColor = AppColors.secondaryColor;
        break;
      case MatchState.halfTime:
        value = "Half-time";
        textColor = AppColors.secondaryColor;
        break;
      case MatchState.penalty:
        value = "Penalty";
        textColor = AppColors.secondaryColor;
        break;
      case MatchState.finished:
        if (teamScore > opponentScore) {
          value = "Victory";
          textColor = AppColors.liveColor;
        } else if (teamScore < opponentScore) {
          value = "Defeat";
          textColor = AppColors.secondaryColor;
        } else {
          value = "Draw";
          textColor = AppColors.textColor;
        }
        break;
    }

    return Text(value, style: TextStyle(fontSize: 15, color: textColor));
  }

  List<Played> get lineUp => match.match.lineup;

  set lineUp(List<Played> value) {
    match.match.lineup = value;
  }
}
