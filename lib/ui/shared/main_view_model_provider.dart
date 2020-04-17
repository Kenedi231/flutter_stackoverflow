import 'package:flutter/material.dart';
import 'package:infinity_list/core/viewmodels/screens/main_screen_view_model.dart';
import 'package:provider/provider.dart';

class MainViewModelProvider<T extends MainScreenViewModel> extends StatefulWidget {
  final MainScreenViewModel model;
  final Widget Function(T model) builder;

  MainViewModelProvider({@required this.builder, @required this.model});

  @override
  _MainViewModelProviderState createState() => _MainViewModelProviderState();
}

class _MainViewModelProviderState extends State<MainViewModelProvider> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainScreenViewModel>(
      create: (_) => widget.model,
      child: Consumer<MainScreenViewModel>(
        builder: (BuildContext context, MainScreenViewModel value, Widget child) => widget.builder(value),
      ),
    );
  }
}