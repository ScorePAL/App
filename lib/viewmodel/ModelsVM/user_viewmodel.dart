import 'package:flutter/cupertino.dart';
import 'package:score_pal/model/User/user.dart';

class UserViewModel extends ChangeNotifier {
  UserViewModel(this._user);

  final User _user;

  User get user => _user;

  String get getUsername => _user.getUsername();
}