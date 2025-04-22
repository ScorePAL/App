import 'package:score_pal/model/Played/penalty_obtaining_method.dart';
import 'package:score_pal/model/Played/penalty_result.dart';
import 'package:score_pal/model/Played/played.dart';

class Penalty {
  PenaltyObtainingMethod _obtainingMethod;
  PenaltyResult _result;
  int _penaltyTime;
  Played _played;

  Penalty(this._obtainingMethod, this._result, this._penaltyTime, this._played);

  PenaltyObtainingMethod get obtainingMethod => _obtainingMethod;

  set obtainingMethod(PenaltyObtainingMethod value) {
    _obtainingMethod = value;
  }

  PenaltyResult get result => _result;

  set result(PenaltyResult value) {
    _result = value;
  }

  int get penaltyTime => _penaltyTime;

  set penaltyTime(int value) {
    _penaltyTime = value;
  }

  Played get played => _played;

  set played(Played value) {
    _played = value;
  }
}