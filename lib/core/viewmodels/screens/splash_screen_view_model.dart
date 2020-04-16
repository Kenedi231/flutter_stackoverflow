import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:infinity_list/core/viewmodels/base_view_model.dart';

class SplashScreenViewModel extends BaseViewModel {
  // Values
  String mainTitle = 'Stackoverflow questions';
  String secondTitle = 'by Kolya';

  SplashScreenViewModel({@required BuildContext context}) : super(context: context);

  void navigateToMain() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/main');
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}