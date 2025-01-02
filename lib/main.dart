import 'package:flutter/material.dart';
import 'package:mobile_app/view/home.dart';

import 'model/Club/club.dart';
import 'model/User/role.dart';
import 'model/User/user.dart';

void main() {
  Club club = Club();
  club.id = 1;
  User user = User("John", "Doe", 25, Role.admin, club, "fr_FR");
  runApp(MyApp(user));
}

class MyApp extends StatelessWidget {
  const MyApp(this.user, {super.key});

  final User user;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(user),
    );
  }
}