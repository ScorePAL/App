import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      const Center(child: Text("Settings")),
    ];

    return Scaffold(
      backgroundColor: viewModel.backgroundColor,
      body: views[viewModel.currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavBarWidget(),
    );
  }
}
