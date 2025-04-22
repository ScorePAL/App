import '../Club/club.dart';
import 'role.dart';

class User {
  final String _firstName;
  final String _lastName;
  final int _age;
  final Role _role;
  final Club _relatedTo;

  User(this._firstName, this._lastName, this._age, this._role, this._relatedTo);

  String getUsername() {
    return "$_firstName $_lastName";
  }

  Club get relatedTo => _relatedTo;
}
