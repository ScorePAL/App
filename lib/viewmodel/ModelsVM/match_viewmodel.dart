import 'package:flutter/cupertino.dart';
import 'package:score_pal/model/Match/i_match.dart';

class MatchViewModel extends ChangeNotifier {
  MatchViewModel(this._match);

  final IMatch _match;

  IMatch get match => _match;

  get lineup => match.lineup;

  String get formation => match.formation;
}