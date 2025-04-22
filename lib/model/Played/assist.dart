import 'package:score_pal/model/Played/assist_type.dart';
import 'package:score_pal/model/Played/played.dart';

class Assist {
  int _id;
  AssistType _assistType = AssistType.pass;
  int _assistTime;
  Played _played;
  Played _assistedPlayed;

  Assist(this._id,
    this._assistType,
    this._assistTime,
    this._played,
    this._assistedPlayed,
  );

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  AssistType get assistType => _assistType;

  set assistType(AssistType value) {
    _assistType = value;
  }

  int get assistTime => _assistTime;

  set assistTime(int value) {
    _assistTime = value;
  }

  Played get played => _played;

  set played(Played value) {
    _played = value;
  }

  Played get assistedPlayed => _assistedPlayed;

  set assistedPlayed(Played value) {
    _assistedPlayed = value;
  }
}