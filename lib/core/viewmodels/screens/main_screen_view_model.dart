import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:infinity_list/core/services/api_services.dart';
import 'package:infinity_list/core/viewmodels/base_view_model.dart';

class MainScreenViewModel extends BaseViewModel {
  List<dynamic> posts = new List();
  int currentPage = 1;
  final apiSerivce = ApiService.create();

  MainScreenViewModel({@required BuildContext context}) : super(context: context);

  Future<void> getPosts() async {
    Response response = await apiSerivce.getRandomData();
    print(response.body);
    if (response.body != null) {
      posts.addAll(response.body['entries']);
      currentPage++;
    } else {
      posts.addAll(List<dynamic>.generate(15, (i) => {'title': 'Hello $i'}));
    }
    notifyListeners();
  }

  void logout(context1) async {
    await FlutterKeychain.remove(key: 'user');
    Navigator.of(context1).pushNamedAndRemoveUntil('/auth', (router) => false);
  }

  @override
  void dispose() {
    super.dispose();
  }
}