import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobile_app/model/Match/i_match.dart';
import 'package:mobile_app/model/Match/match_state.dart';
import 'package:mobile_app/model/Team/i_team.dart';

import '../../model/Player/player.dart';

class MatchWidgetDecorator with IMatch {
  final IMatch match;

  MatchWidgetDecorator(this.match);

  @override
  get team => match.team;

  @override
  get teamScore => match.teamScore;

  @override
  get opponentScore => match.opponentScore;

  @override
  get state => match.state;

  @override
  get opponent => match.opponent;

  @override
  get date => match.date;

  @override
  get address => match.address;

  @override
  get coach => match.coach;

  @override
  get id => match.id;

  @override
  get isHome => match.isHome;

  @override
  set address(String value) {
    match.address = value;
  }

  @override
  set date(DateTime value) {
    match.date = value;
  }

  @override
  set opponent(ITeam value) {
    match.opponent = value;
  }

  @override
  set opponentScore(int value) {
    match.opponentScore = value;
  }

  @override
  set state(MatchState value) {
    match.state = value;
  }

  @override
  set team(ITeam value) {
    match.team = value;
  }

  @override
  set teamScore(int value) {
    match.teamScore = value;
  }

  @override
  set coach(String value) {
    match.coach = value;
  }

  @override
  set id(int value) {
    match.id = value;
  }

  @override
  set isHome(bool value) {
    match.isHome = value;
  }

  Text getStateInterface() {
    String value = "";
    Color textColor = Colors.textColor;

    switch (state) {
      case MatchState.notStarted:
        value = date.toString();
        break;
      case MatchState.firstHalf:
        value = "🎥 45'";
        textColor = Colors.secondaryColor;
        break;
      case MatchState.secondHalf:
        value = "🎥 90'";
        textColor = Colors.secondaryColor;
        break;
      case MatchState.halfTime:
        value = "Half-time";
        textColor = Colors.secondaryColor;
        break;
      case MatchState.penalty:
        value = "Penalty";
        textColor = Colors.secondaryColor;
        break;
      case MatchState.finished:
        if (teamScore > opponentScore) {
          value = "Victory";
          textColor = Colors.live;
        } else if (teamScore < opponentScore) {
          value = "Defeat";
          textColor = Colors.secondaryColor;
        } else {
          value = "Draw";
          textColor = Colors.textColor;
        }
        break;
    }

    return Text(value, style: TextStyle(fontSize: 15, color: textColor));
  }

  @override
  List<Player> get lineUp => match.lineUp;

  @override
  set lineUp(List<Player> value) {
    match.lineUp = value;
  }
}