class Club {
  late int _clubId;
  late String _name;
  late String _logoUrl;

  int get id => _clubId;

  String get logoUrl => _logoUrl;

  // TODO: implement name
  String get name => _name;

  set id(int id) {
    _clubId = id;
  }

  set logoUrl(String logoUrl) {
    _logoUrl = logoUrl;
  }

  set name(String name) {
    _name = name;
  }
}