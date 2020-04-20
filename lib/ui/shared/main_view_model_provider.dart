import 'package:flutter/material.dart';
import 'package:infinity_list/core/viewmodels/screens/main_screen_view_model.dart';
import 'package:provider/provider.dart';

class MainViewModelProvider<T extends MainScreenViewModel> extends StatelessWidget {
  final Widget Function(T model) builder;

  MainViewModelProvider({@required this.builder});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenViewModel>(
      builder: (BuildContext context, MainScreenViewModel value, Widget child) => builder(value),
    );
  }
}