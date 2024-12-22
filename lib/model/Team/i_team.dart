mixin ITeam {
  /// Return the fff id of the team
  int get fffId;

  /// Set the fff id to the given value
  ///
  /// **value** : The fff id of the team
  set fffId(int value);

  /// Return the name of the team
  String get name;

  /// Set the name of the team to the given value
  ///
  /// **value** : The name of the team
  set name(String value);

  /// Return the logo of the team
  String get logo;

  /// Set the logo of the team to the given value
  ///
  /// **value** : The logo of the team
  set logo(String value);
}