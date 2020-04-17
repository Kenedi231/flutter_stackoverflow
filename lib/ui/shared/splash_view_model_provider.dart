import 'package:flutter/material.dart';
import 'package:infinity_list/core/viewmodels/screens/splash_screen_view_model.dart';
import 'package:provider/provider.dart';

class SplashViewModelProvider<T extends SplashScreenViewModel> extends StatelessWidget {
  final SplashScreenViewModel model;
  final Widget Function(T model) builder;

  SplashViewModelProvider({@required this.builder, @required this.model});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (BuildContext context2) {
        model.navigateToMain();
        return model;
      },
      child: Consumer<T>(
        builder: (BuildContext context, T value, Widget child) => builder(value),
      ),
    );
  }
}