import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_pal/app/app_colors.dart';
import 'package:score_pal/view/GlobalWidgets/live_score_match_widget.dart';
import 'package:score_pal/view/LiveMatch/widgets/match_widget.dart';
import 'package:score_pal/viewmodel/Match/match_screen_viewmodel.dart';
import 'package:score_pal/viewmodel/ModelsVM/match_viewmodel.dart';

class MatchScreen extends StatelessWidget {
  final MatchViewModel match;

  const MatchScreen({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MatchScreenViewModel>(
      create: (_) => MatchScreenViewModel(match),
      child: Consumer<MatchScreenViewModel>(
        builder: (context, viewModel, child) {
          return _MatchScreenState(viewModel: viewModel);
        },
      ),
    );
  }
}

class _MatchScreenState extends StatelessWidget {
  final MatchScreenViewModel viewModel;

  const _MatchScreenState({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          foregroundColor: Colors.white,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LiveScoreMatchWidget(viewModel.match),
            // Match lineup
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: MatchWidget(viewModel.match),
            )
          ],
        ));
  }
}
