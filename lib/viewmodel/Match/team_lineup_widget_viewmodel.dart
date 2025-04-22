import 'package:flutter/cupertino.dart';
import 'package:score_pal/view/LiveMatch/widgets/match_widget.dart';
import 'package:score_pal/viewmodel/ModelsVM/match_viewmodel.dart';

class TeamLineupWidgetViewModel extends ChangeNotifier {
  InterfaceState _state = InterfaceState.lineup;
  final MatchViewModel _match;

  TeamLineupWidgetViewModel(this._match);

  Set<InterfaceState> get selectedState => <InterfaceState>{_state};

  set state(InterfaceState value) {
    _state = value;
    notifyListeners();
  }

  get match => _match;
}