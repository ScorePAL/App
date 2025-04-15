import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_pal/app/app_colors.dart';
import 'package:score_pal/model/Match/i_match.dart';
import 'package:score_pal/view/GlobalWidgets/live_score_match_widget.dart';
import 'package:score_pal/view/GlobalWidgets/match_widget_decorator.dart';
import 'package:score_pal/viewmodel/Home/home_screen_match_widget_viewmodel.dart';

class HomeScreenMatchButton extends StatelessWidget {
  final IMatch match;

  const HomeScreenMatchButton({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          HomeScreenMatchWidgetViewModel(MatchWidgetDecorator(match)),
      child: Consumer<HomeScreenMatchWidgetViewModel>(
        builder: (context, viewModel, child) {
          return _HomeScreenMatchButtonContent(viewModel: viewModel);
        },
      ),
    );
  }
}

class _HomeScreenMatchButtonContent extends StatelessWidget {
  final HomeScreenMatchWidgetViewModel viewModel;

  const _HomeScreenMatchButtonContent({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width * 0.87;
    double height = MediaQuery.sizeOf(context).height * 0.1;

    return FilledButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            return AppColors.widgetBackground;
          }),
          fixedSize:WidgetStateProperty.resolveWith((states) {
            return Size(width, height);
          }),
          shape: WidgetStateOutlinedBorder.resolveWith((states) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(
                color: AppColors.widgetBackground,
                width: 2,
              ),
            );
          }),
        ),
        onPressed: () {
          viewModel.displayMatch(context);
        },
        child: LiveScoreMatchWidget(viewModel.match));
  }
}
