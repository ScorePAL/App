import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:score_pal/app/app_colors.dart';
import 'package:score_pal/view/Home/widgets/home_screen_match_button.dart';
import 'package:score_pal/viewmodel/Home/home_viewmodel.dart';
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
      body: SingleChildScrollView(
        child: Column(
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
                  Text(
                      "welcome".tr(namedArgs: {"user": _viewModel.getUsername}),
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
                  Text("weekMatches".tr(),
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
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "stats".tr(),
                style: TextStyle(fontSize: 20, color: AppColors.textColor),
              ),
            ),
            SizedBox(
              height: 300,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PieChart(
                    PieChartData(
                      sectionsSpace: 2,
                      centerSpaceRadius: 60,
                      startDegreeOffset: -90,
                      borderData: FlBorderData(show: false),
                      pieTouchData: PieTouchData(
                        touchCallback: (event, response) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                response == null ||
                                response.touchedSection == null) {
                              _viewModel.touchedIndex = -1;
                              return;
                            }
                            _viewModel.touchedIndex =
                                response.touchedSection!.touchedSectionIndex;
                          });
                        },
                      ),
                      sections: _viewModel.showingStyledSections(),
                    ),
                  ),
                  Text(
                    _viewModel.total, // ton total ici
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
