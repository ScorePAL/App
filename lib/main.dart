import 'package:flutter/material.dart';
import 'package:mobile_app/model/Match/i_match.dart';
import 'package:mobile_app/model/Match/match.dart';
import 'package:mobile_app/view/Match/home_screen_match_widget.dart';

import 'AppColors.dart';
import 'model/Team/i_team.dart';
import 'model/Team/team.dart';
import 'model/User/role.dart';
import 'model/User/user.dart';
import 'model/Match/match_state.dart';

void main() {
  User user = User("John", "Doe", 25, Role.admin);
  runApp(MyApp(user));
}

class MyApp extends StatelessWidget {
  const MyApp(this.user, {super.key});

  final User user;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(user: user),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.user});

  final User user;

  @override
  State<HomePage> createState() => _HomePageState(user: user);
}

class _HomePageState extends State<HomePage> {
  _HomePageState({required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    IMatch match = Match();
    ITeam team = Team();
    team.name = "USRF A";
    team.logo = "assets/images/logo.png";

    ITeam opponent = Team();
    opponent.name = "Chagny";
    opponent.logo = "assets/images/opponent_logo.png";

    match.team = team;
    match.opponent = opponent;
    match.teamScore = 4;
    match.opponentScore = 2;

    match.state = MatchState.halfTime;
    match.date = DateTime.now();
    match.address = "Stade des pommiers";
    match.coach = "Jean Dupont";

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Center(
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).width * 0.15),
                  child:
                  Text(
                    "Vamos Vamos",
                    style: TextStyle(fontSize: 50, color: AppColors.textColor),
                  ),
                ),
                Text("Bienvenue {username}", style: TextStyle(fontSize: 20, color: AppColors.textColor)),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.03),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Résultats de cette semaine :", style: TextStyle(fontSize: 20, color: AppColors.textColor)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HomeScreenMatchWidget(match),
                    HomeScreenMatchWidget(match),
                    HomeScreenMatchWidget(match),
                  ],
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
