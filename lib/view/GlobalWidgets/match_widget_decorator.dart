import 'package:flutter/material.dart';
import 'package:score_pal/model/Match/i_match.dart';
import 'package:score_pal/model/Match/match_state.dart';
import 'package:score_pal/model/Team/i_team.dart';
import 'package:score_pal/viewmodel/ModelsVM/match_viewmodel.dart';

import '../../../app/app_colors.dart';
import '../../../model/Player/player.dart';

class MatchWidgetDecorator {
  final MatchViewModel match;

  MatchWidgetDecorator(this.match);

  @override
  ITeam get team => match.match.team;

  @override
  int get teamScore => match.match.teamScore;

  @override
  int get opponentScore => match.match.opponentScore;

  @override
  MatchState get state => match.match.state;

  @override
  ITeam get opponent => match.match.opponent;

  @override
  DateTime get date => match.match.date;

  @override
  String get address => match.match.address;

  @override
  String get coach => match.match.coach;

  @override
  int get id => match.match.id;

  @override
  bool get isHome => match.match.isHome;

  @override
  set address(String value) {
    match.match.address = value;
  }

  @override
  set date(DateTime value) {
    match.match.date = value;
  }

  @override
  set opponent(ITeam value) {
    match.match.opponent = value;
  }

  @override
  set opponentScore(int value) {
    match.match.opponentScore = value;
  }

  @override
  set state(MatchState value) {
    match.match.state = value;
  }

  @override
  set team(ITeam value) {
    match.match.team = value;
  }

  @override
  set teamScore(int value) {
    match.match.teamScore = value;
  }

  @override
  set coach(String value) {
    match.match.coach = value;
  }

  @override
  set id(int value) {
    match.match.id = value;
  }

  @override
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

  @override
  List<Player> get lineUp => match.match.lineUp;

  @override
  set lineUp(List<Player> value) {
    match.match.lineUp = value;
  }
}