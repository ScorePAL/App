import 'package:score_pal/viewmodel/LineupFactory/LineupFormations/implementations/formation_442.dart';
import 'package:score_pal/viewmodel/LineupFactory/LineupFormations/lineup_formation.dart';

class LineupFactory {
  Map<String, LineupFormations> formations = <String, LineupFormations>{};

  LineupFactory() {
    formations["4-4-2"] = Formation442();
  }

  LineupFormations getFormation(String formation) {
    if (formations.keys.contains(formation)) {
      return formations[formation]!;
    } else {
      return formations["4-4-2"]!; // Default formation
    }
  }

}