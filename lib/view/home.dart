import 'package:flutter/material.dart';

import '../app/app_colors.dart';
import '../model/Match/i_match.dart';
import '../model/Match/match_state.dart';
import '../model/Team/i_team.dart';
import '../model/Team/team.dart';
import '../model/User/user.dart';
import '../viewmodel/Home/home_view_model.dart';
import 'Match/home_screen_match_widget.dart';
import '../model/Match/match.dart';

class HomePage extends StatefulWidget {
  const HomePage(this._user, {super.key});

  final User _user;


  @override
  State<HomePage> createState() => _HomePageState(_user);
}

class _HomePageState extends State<HomePage> {
  _HomePageState(this._user) {
    _viewModel = HomeViewModel(_user);
  }

  final User _user;
  late HomeViewModel _viewModel;


  @override
  void dispose() {
    super.dispose();
  }

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
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.sizeOf(context).width * 0.15),
                    child: Text(
                      "Vamos Vamos",
                      style:
                      TextStyle(fontSize: 50, color: AppColors.textColor),
                    ),
                  ),
                  Text("Bienvenue ${_user.getUsername()}",
                      style:
                      TextStyle(fontSize: 20, color: AppColors.textColor)),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.sizeOf(context).height * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Les matchs de la semaine",
                      style:
                      TextStyle(fontSize: 20, color: AppColors.textColor)),
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
        ));
  }
}
