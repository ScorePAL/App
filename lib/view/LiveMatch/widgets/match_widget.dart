import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_pal/model/Match/i_match.dart';
import 'package:score_pal/view/GlobalWidgets/lineup_widget.dart';
import 'package:score_pal/viewmodel/Match/team_lineup_widget_viewmodel.dart';
import 'package:score_pal/viewmodel/ModelsVM/match_viewmodel.dart';

class MatchWidget extends StatelessWidget {
  final MatchViewModel match;

  const MatchWidget(this.match, {super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TeamLineupWidgetViewModel(match),
      child: Consumer<TeamLineupWidgetViewModel>(
        builder: (context, viewModel, child) {
          return _MatchContent(viewModel: viewModel);
        },
      ),
    );
  }
}

enum InterfaceState { lineup, history }

class _MatchContent extends StatelessWidget {
  final TeamLineupWidgetViewModel viewModel;

  const _MatchContent({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 5,
      children: [
        SegmentedButton(
          style: SegmentedButton.styleFrom(
            backgroundColor: Colors.grey[800],
            foregroundColor: Colors.white,
            selectedBackgroundColor: Colors.white,
            selectedForegroundColor: Colors.grey[800],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          showSelectedIcon: false,
          segments: [
            ButtonSegment(
                value: InterfaceState.lineup,
                label: _getLabelWithStyle(Text('lineup'.tr()))),
            ButtonSegment(
              value: InterfaceState.history,
              label: _getLabelWithStyle(Text('highlights'.tr())),
            ),
          ],
          selected: viewModel.selectedState,
          onSelectionChanged: (Set<InterfaceState> newSelection) {
            viewModel.state = newSelection.first;
          },
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: viewModel.selectedState.first == InterfaceState.lineup
              ? LineupWidget(match: viewModel.match)
              : Text(
                  "debug",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
        ),
      ],
    );
  }

  Widget _getLabelWithStyle(Text text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: text,
    );
  }
}
