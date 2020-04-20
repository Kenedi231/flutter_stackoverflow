import 'dart:async';
import 'package:flutter_keychain/flutter_keychain.dart';

import 'package:flutter/cupertino.dart';
import 'package:infinity_list/core/viewmodels/base_view_model.dart';

class SplashScreenViewModel extends BaseViewModel {
  // Values
  String mainTitle = 'Infinity list';
  String secondTitle = 'by Kolya';

  SplashScreenViewModel({@required BuildContext context}) : super(context: context);

  void navigateToNextScreen() {
    Future.delayed(Duration(seconds: 3), () async {
      final key = await FlutterKeychain.get(key: 'user');

      if (key != null) {
        Navigator.of(context).pushReplacementNamed('/main');
      } else {
        Navigator.of(context).pushReplacementNamed('/auth');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}