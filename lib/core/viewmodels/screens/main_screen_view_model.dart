import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:infinity_list/core/models/post_model.dart';
import 'package:infinity_list/core/services/api_services.dart';
import 'package:infinity_list/core/viewmodels/base_view_model.dart';

class MainScreenViewModel extends BaseViewModel {
  List<dynamic> posts;
  final apiSerivce = ApiService.create();

  MainScreenViewModel({@required BuildContext context}) : super(context: context);

  Future<void> getPosts() async {
    Response response = await apiSerivce.getPosts('1');
    posts = response.body['items'];
    for (var value in posts) {
      print(value);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}