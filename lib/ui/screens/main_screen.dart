import 'package:flutter/material.dart';
import 'package:infinity_list/core/viewmodels/screens/main_screen_view_model.dart';
import 'package:infinity_list/ui/shared/main_view_model_provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainViewModelProvider<MainScreenViewModel>(
      model: MainScreenViewModel(context: context),
      builder: (MainScreenViewModel model) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'good',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Haha',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}