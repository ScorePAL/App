import 'package:flutter/material.dart';
import 'package:mobile_app/model/Match/i_match.dart';
import 'package:mobile_app/model/Match/match_state.dart';
import 'package:mobile_app/view/Match/match_widget_decorator.dart';
import 'package:mobile_app/viewmodel/Home/home_screen_match_widget_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreenMatchWidget extends StatelessWidget {
  final IMatch match;

  const HomeScreenMatchWidget(this.match, {super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeScreenMatchWidgetViewModel(MatchWidgetDecorator(match)),
      child: Consumer<HomeScreenMatchWidgetViewModel>(
        builder: (context, viewModel, child) {
          return MatchWidgetContent(viewModel: viewModel);
        },
      ),
    );
  }
}

class MatchWidgetContent extends StatelessWidget {
  final HomeScreenMatchWidgetViewModel viewModel;

  const MatchWidgetContent({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width * 0.87;
    double height = MediaQuery.sizeOf(context).height * 0.1;

    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.widgetBackground,
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(viewModel.team.logo, width: height * 0.6, height: height * 0.6),
                Text(viewModel.team.name, style: TextStyle(fontSize: 20, color: Colors.textColor)),
              ],
            ),
            _buildScoreColumn(viewModel.teamScore, viewModel.opponentScore, viewModel.getStateInterface()),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(viewModel.opponent.logo, width: height * 0.6, height: height * 0.6),
                Text(viewModel.opponent.name, style: TextStyle(fontSize: 20, color: Colors.textColor)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreColumn(int teamScore, int opponentScore, Text matchState) {
    TextStyle infosStyle = TextStyle(fontSize: 15, color: Colors.textColor);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(teamScore.toString(), style: TextStyle(fontSize: 25, color: Colors.textColor)),
            Text(" - ", style: TextStyle(fontSize: 25, color: Colors.textColor)),
            Text(opponentScore.toString(), style: TextStyle(fontSize: 25, color: Colors.textColor)),
          ],
        ),
        matchState,
      ],
    );
  }
}