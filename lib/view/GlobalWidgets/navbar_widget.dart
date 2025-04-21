import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_pal/app/app_colors.dart';
import 'package:score_pal/viewmodel/nav_viewmodel.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NavViewModel>(context);

    return BottomAppBar(
      height: 60,
      color: AppColors.widgetBackground,
      shape: const CircularNotchedRectangle(),
      notchMargin: 0.0,
      surfaceTintColor: AppColors.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(viewModel.getIcon("home"),
                size: 40,
                color: viewModel.getIconColor("home")),
            onPressed: () => viewModel.setIndex(0),
          ),
          const SizedBox(), // espace pour le FAB
          IconButton(
            icon: Icon(viewModel.getIcon("settings"),
                size: 40,
                color: viewModel.getIconColor("settings")),
            onPressed: () => viewModel.setIndex(1),
          ),
        ],
      ),
    );
  }
}
