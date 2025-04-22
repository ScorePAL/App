import 'package:flutter/cupertino.dart';
import 'package:score_pal/viewmodel/LineupFactory/lineup_factory.dart';
import 'package:score_pal/viewmodel/ModelsVM/match_viewmodel.dart';

class LineupWidgetViewModel extends ChangeNotifier {
  final MatchViewModel match;
  final LineupFactory lineupFactory = LineupFactory();

  LineupWidgetViewModel(this.match);

  List<Positioned> getLineup() {
    var formation = lineupFactory.getFormation(match.formation);
    return formation.getFormation(match.lineup);
  }
}
