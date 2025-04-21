import 'package:flutter/material.dart';

import 'ModelsVM/user_viewmodel.dart';

class NavViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  final UserViewModel _user;

  NavViewModel(this._user);

  UserViewModel get user => _user;

  int get currentIndex => _currentIndex;

  Color get backgroundColor {
    switch (_currentIndex) {
      case 0:
        return Colors.white;
      case 1:
        return Colors.blue.shade50;
      default:
        return Colors.white;
    }
  }

  Color getIconColor(String key) {
    switch (key) {
      case "home":
        return _currentIndex == 0 ? Colors.blue : Colors.grey;
      case "settings":
        return _currentIndex == 1 ? Colors.blue : Colors.grey;
      default:
        return Colors.grey;
    }
  }

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
