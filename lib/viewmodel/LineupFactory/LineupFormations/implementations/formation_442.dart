import 'package:flutter/material.dart';
import 'package:score_pal/model/Played/played.dart';
import 'package:score_pal/viewmodel/LineupFactory/LineupFormations/lineup_formation.dart';

class Formation442 implements LineupFormations {
  @override
  List<Positioned> getFormation(List<Played> players) {
    players.sort((a, b) => (a.position.index).compareTo(b.position.index));

    return [
    ];
  }
}