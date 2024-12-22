import 'package:mobile_app/model/Player/positions.dart';

mixin IPlayer {
  /// The unique identifier of the player.
  int get id;

  /// Set the unique identifier of the player.
  ///
  /// **value** : the unique identifier of the player.
  set id(int value);

  /// The first name of the player.
  String get firstName;

  /// Set the first name of the player.
  ///
  /// **value** : the first name of the player.
  set firstName(String value);

  /// The last name of the player.
  String get lastName;

  /// Set the last name of the player.
  ///
  /// **value** : the last name of the player.
  set lastName(String value);

  /// The date of birth of the player.
  ///
  /// **value** : the date of birth of the player.
  DateTime get dateOfBirth;

  /// Set the date of birth of the player.
  ///
  /// **value** : the date of birth of the player.
  set dateOfBirth(DateTime value);

  /// Positions played by the player.
  List<Positions> get positions;

  /// Set the positions played by the player.
  ///
  /// **value** : the positions played by the player.
  set positions(List<Positions> value);
}