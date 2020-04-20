import 'package:flutter/material.dart';
import 'package:infinity_list/core/viewmodels/screens/auth_screen_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModelProvider<T extends AuthScreenViewModel> extends StatelessWidget {
  final Widget Function(T model) builder;

  AuthViewModelProvider({@required this.builder});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthScreenViewModel>(
      builder: (BuildContext context, AuthScreenViewModel value, Widget child) => builder(value),
    );
  }
}