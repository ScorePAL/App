import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_pal/app/app_colors.dart';
import 'package:score_pal/view/GlobalWidgets/navbar_widget.dart';
import 'package:score_pal/view/Home/home.dart';
import 'package:score_pal/viewmodel/ModelsVM/user_viewmodel.dart';
import 'package:score_pal/viewmodel/nav_viewmodel.dart';

class MainScreen extends StatelessWidget {
  final UserViewModel _user;

  const MainScreen(this._user, {super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavViewModel(_user),
      child: const _MainScreenContent(),
    );
  }
}

class _MainScreenContent extends StatelessWidget {
  const _MainScreenContent();

  @override
  Widget build(BuildContext context) {
    final NavViewModel viewModel = Provider.of<NavViewModel>(context);

    final views = [
      HomePage(viewModel.user),
      const Center(
          child: Text(
        "Settings",
        style: TextStyle(color: Colors.white),
      )),
    ];

    return Scaffold(
      backgroundColor: AppColors.widgetBackground,
      body: views[viewModel.currentIndex],
      floatingActionButton: Transform.translate(
        offset: Offset(0, 10),
        child: SizedBox(
          height: 60,
          width: 60,
          child: FloatingActionButton(
            backgroundColor: AppColors.mainColor,
            shape: CircleBorder(),
            onPressed: () {},
            child: Icon(
              Icons.add,
              size: 36,
              color: Colors.white,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavBarWidget(),
    );
  }
}
