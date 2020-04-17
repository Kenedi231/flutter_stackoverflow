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
    Response response = await apiSerivce.getPosts(currentPage);
    if (response.body != null) {
      posts.addAll(response.body['items']);
      currentPage++;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}