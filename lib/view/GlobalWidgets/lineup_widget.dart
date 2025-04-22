import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_pal/viewmodel/ModelsVM/match_viewmodel.dart';
import 'package:score_pal/viewmodel/lineup_widget_viewmodel.dart';

class LineupWidget extends StatelessWidget {
  final MatchViewModel match;

  const LineupWidget({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LineupWidgetViewModel(match),
      child: Consumer<LineupWidgetViewModel>(
        builder: (context, viewModel, child) {
          return _LineupContent(viewModel: viewModel);
        },
      ),
    );
  }
}

class _LineupContent extends StatelessWidget {
  final LineupWidgetViewModel viewModel;

  const _LineupContent({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    AssetImage field = AssetImage('assets/images/match/field.png');

    // Calculate the available width (80% of screen width)
    double availableWidth = MediaQuery.of(context).size.width * 0.8;

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: availableWidth,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Background field image
                Image(
                  image: field,
                  fit: BoxFit.contain,
                ),
                ...viewModel.getLineup(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
