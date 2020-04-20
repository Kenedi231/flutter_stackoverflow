import 'package:flutter/material.dart';
import 'package:infinity_list/core/viewmodels/screens/auth_screen_view_model.dart';
import 'package:infinity_list/ui/shared/auth_view_model_provider.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  ScrollController _scrollController = new ScrollController();
  var update = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AuthViewModelProvider<AuthScreenViewModel>(
      builder: (AuthScreenViewModel model) {
        return Consumer<AuthScreenViewModel>(
          builder: (context, model, child) => Scaffold(
            backgroundColor: Colors.grey[900],
            body: Center(child: Text('Auth Screen', style: TextStyle(color: Colors.white),)),
          ),
        );
      },
    );
  }
}