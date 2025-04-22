import 'package:flutter/material.dart';
import 'package:score_pal/model/Played/played.dart';

mixin LineupFormations {
  /// Returns a list of Positioned widgets representing the formation of the lineup.
  /// This list is used to display the players on the field in a specific formation.
  List<Positioned> getFormation(List<Played> players);
}