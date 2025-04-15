import 'package:flutter/material.dart';
import 'package:score_pal/model/Match/i_match.dart';
import 'package:score_pal/view/GlobalWidgets/match_widget_decorator.dart';
import 'package:score_pal/viewmodel/Home/home_screen_match_widget_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../app/app_colors.dart';

class LiveScoreMatchWidget extends StatelessWidget {
  final IMatch match;

  const LiveScoreMatchWidget(this.match, {super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          HomeScreenMatchWidgetViewModel(MatchWidgetDecorator(match)),
      child: Consumer<HomeScreenMatchWidgetViewModel>(
        builder: (context, viewModel, child) {
          return _LiveScoreMatchContent(viewModel: viewModel);
        },
      ),
    );
  }
}

class _LiveScoreMatchContent extends StatelessWidget {
  final HomeScreenMatchWidgetViewModel viewModel;

  const _LiveScoreMatchContent({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height * 0.1;

    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(viewModel.team.logo,
                  width: height * 0.6, height: height * 0.6),
              Text(viewModel.team.name,
                  style: TextStyle(fontSize: 20, color: AppColors.textColor)),
            ],
          ),
          _buildScoreColumn(viewModel.teamScore, viewModel.opponentScore,
              viewModel.getStateInterface()),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(viewModel.opponent.logo,
                  width: height * 0.6, height: height * 0.6),
              Text(viewModel.opponent.name,
                  style: TextStyle(fontSize: 20, color: AppColors.textColor)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildScoreColumn(int teamScore, int opponentScore, Text matchState) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(teamScore.toString(),
                style: TextStyle(fontSize: 25, color: AppColors.textColor)),
            Text(" - ",
                style: TextStyle(fontSize: 25, color: AppColors.textColor)),
            Text(opponentScore.toString(),
                style: TextStyle(fontSize: 25, color: AppColors.textColor)),
          ],
        ),
        matchState,
      ],
    );
  }
}
