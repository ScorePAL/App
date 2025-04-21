import 'package:flutter/material.dart';
import 'package:score_pal/app/app_colors.dart';

import 'ModelsVM/user_viewmodel.dart';

class NavViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  final UserViewModel _user;

  NavViewModel(this._user);

  UserViewModel get user => _user;

  int get currentIndex => _currentIndex;

  IconData getIcon(String key) {
    switch (key) {
      case "home":
        return _currentIndex == 0 ? Icons.home : Icons.home_outlined;
      case "settings":
        return _currentIndex == 1 ? Icons.settings : Icons.settings_outlined;
      default:
        return Icons.error; // Default icon if key is not recognized
    }
  }

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  getIconColor(String s) {
    switch (s) {
      case "home":
        return _currentIndex == 0 ? AppColors.mainColor : Colors.white;
      case "settings":
        return _currentIndex == 1 ? AppColors.mainColor : Colors.white;
      default:
        return Colors.white; // Default color if key is not recognized
    }
  }
}
