import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:score_pal/view/main_screen.dart';
import 'package:score_pal/viewmodel/ModelsVM/user_viewmodel.dart';

import 'model/Club/club.dart';
import 'model/User/role.dart';
import 'model/User/user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  Club club = Club();
  club.id = 1;
  User user = User("John", "Doe", 25, Role.admin, club);
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('fr')],
      path: 'assets/langs',
      fallbackLocale: Locale('en'),
      child: MyApp(user),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp(this.user, {super.key});

  final User user;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      // << obligatoire pour que ça traduise
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      home: MainScreen(UserViewModel(user)),
    );
  }
}
