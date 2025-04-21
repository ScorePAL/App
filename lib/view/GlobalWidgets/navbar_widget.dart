import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_pal/viewmodel/nav_viewmodel.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NavViewModel>(context);

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home,
                color: viewModel.getIconColor("home")),
            onPressed: () => viewModel.setIndex(0),
          ),
          const SizedBox(width: 40), // espace pour le FAB
          IconButton(
            icon: Icon(Icons.settings,
                color: viewModel.getIconColor("settings")),
            onPressed: () => viewModel.setIndex(1),
          ),
        ],
      ),
    );
  }
}
