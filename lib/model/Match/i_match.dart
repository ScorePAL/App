import 'package:score_pal/model/Player/player.dart';
import 'package:score_pal/model/Match/match_state.dart';

import '../Team/i_team.dart';

mixin IMatch {
  /// The unique identifier of the match.
  int get id;

  /// Set the unique identifier of the match.
  ///
  /// **value** : the unique identifier of the match.
  set id(int value);

  /// The team that plays the match.
  ITeam get team;

  /// Set the team that plays the match.
  ///
  /// **value** : the team that plays the match.
  set team(ITeam value);

  /// The opponent team.
  ITeam get opponent;

  /// Set the opponent team.
  ///
  /// **value** : the opponent team.
  set opponent(ITeam value);

  /// The score of the team.
  int get teamScore;

  /// Set the score of the team.
  ///
  /// **value** : the score of the team.
  set teamScore(int value);

  /// The score of the opponent team.
  int get opponentScore;

  /// Set the score of the opponent team.
  ///
  /// **value** : the score of the opponent team.
  set opponentScore(int value);

  /// The address of the match.
  String get address;

  /// Set the address of the match.
  ///
  /// **value** : the address of the match.
  set address(String value);

  /// The date of the match.
  ///
  /// **value** : the date of the match.
  DateTime get date;

  /// Set the date of the match.
  ///
  /// **value** : the date of the match.
  set date(DateTime value);

  /// The match is played at home.
  bool get isHome;

  /// Set if the match is played at home.
  ///
  /// **value** : if the match is played at home.
  set isHome(bool value);

  /// The coach of the team.
  String get coach;

  /// Set the coach of the team.
  ///
  /// **value** : the coach of the team.
  set coach(String value);

  /// The state of the match.
  MatchState get state;

  /// Set the state of the match.
  ///
  /// **value** : the state of the match.
  set state(MatchState value);

  /// The line-up of the team.
  List<Player> get lineUp;

  /// Set the line-up of the team.
  ///
  /// **value** : the line-up of the team.
  set lineUp(List<Player> value);
}
