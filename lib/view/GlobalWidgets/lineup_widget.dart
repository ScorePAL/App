import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_pal/model/Match/i_match.dart';
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
    
    double width = MediaQuery.sizeOf(context).width * 0.8;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: width * 1.85,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: field,
                fit: BoxFit.cover),
          ),
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Title",
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            "Your Big Text ",
            textAlign: TextAlign.left,
          ),
        )
      ],
    );
  }
}
