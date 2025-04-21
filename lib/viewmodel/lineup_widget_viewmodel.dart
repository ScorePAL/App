import 'package:flutter/cupertino.dart';
import 'package:score_pal/model/Match/i_match.dart';
import 'package:score_pal/viewmodel/ModelsVM/match_viewmodel.dart';

class LineupWidgetViewModel extends ChangeNotifier {
  final MatchViewModel match;

  LineupWidgetViewModel(this.match);
}