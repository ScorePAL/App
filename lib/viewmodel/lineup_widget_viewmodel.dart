import 'package:flutter/cupertino.dart';
import 'package:score_pal/model/Match/i_match.dart';

class LineupWidgetViewModel extends ChangeNotifier {
  final IMatch match;

  LineupWidgetViewModel(this.match);
}