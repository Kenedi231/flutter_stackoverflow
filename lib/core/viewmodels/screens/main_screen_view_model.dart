import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:infinity_list/core/models/post_model.dart';
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

  void prindOne() {
    print(1);
  }

  @override
  void dispose() {
    super.dispose();
  }
}