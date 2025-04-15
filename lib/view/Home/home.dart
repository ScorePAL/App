import 'package:flutter/material.dart';

import 'package:score_pal/app/app_colors.dart';
import 'package:score_pal/model/Match/i_match.dart';
import 'package:score_pal/model/Match/match_state.dart';
import 'package:score_pal/model/Team/i_team.dart';
import 'package:score_pal/model/Team/team.dart';
import 'package:score_pal/model/User/user.dart';
import 'package:score_pal/view/Home/widgets/home_screen_match_button.dart';
import 'package:score_pal/viewmodel/Home/home_viewmodel.dart';
import 'package:score_pal/model/Match/match.dart';
import 'package:score_pal/viewmodel/ModelsVM/user_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage(this._user, {super.key});

  final UserViewModel _user;


  @override
  State<HomePage> createState() => _HomePageState(_user);
}

class _HomePageState extends State<HomePage> {
  _HomePageState(UserViewModel user) {
    _viewModel = HomeViewModel(user);
  }

  late HomeViewModel _viewModel;
  
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      "ScorePAL",
                      style:
                      TextStyle(fontSize: 50, color: AppColors.textColor),
                    ),
                  ),
                  Text("Bienvenue ${_viewModel.getUsername}",
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
                    spacing: MediaQuery.sizeOf(context).height * 0.02,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HomeScreenMatchButton(match: _viewModel.getMatch(0)),
                      HomeScreenMatchButton(match: _viewModel.getMatch(1)),
                      HomeScreenMatchButton(match: _viewModel.getMatch(2)),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
