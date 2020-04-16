import 'package:flutter/material.dart';
import 'package:infinity_list/core/viewmodels/screens/main_screen_view_model.dart';
import 'package:provider/provider.dart';

class MainViewModelProvider<T extends MainScreenViewModel> extends StatelessWidget {
  final MainScreenViewModel model;
  final Widget Function(T model) builder;

  MainViewModelProvider({@required this.builder, @required this.model});

  @override
  Widget build(BuildContext context) {
    model.getPosts();
    return ChangeNotifierProvider<T>(
      create: (BuildContext context2) => model,
      child: Consumer<T>(
        builder: (BuildContext context, T value, Widget child) => builder(value),
      ),
    );
  }
}