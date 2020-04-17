import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinity_list/core/viewmodels/screens/main_screen_view_model.dart';
import 'package:infinity_list/ui/screens/main_screen.dart';
import 'package:infinity_list/ui/screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'core/constants/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return ChangeNotifierProvider(
      child: MaterialApp(
        title: 'Flutter Provider Architecture Starter',
        theme: ThemeData(
          primarySwatch: ProjectColors.main,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/main': (context) => MainScreen(),
        },
      ), create: (BuildContext context) {},
    );
  }
}