import 'package:flutter/cupertino.dart';
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:infinity_list/core/viewmodels/base_view_model.dart';

class AuthScreenViewModel extends BaseViewModel {

  AuthScreenViewModel({@required BuildContext context}) : super(context: context);

  void login(context1) async {
    await FlutterKeychain.put(key: 'user', value: 'kolya');
    Navigator.of(context1).pushNamedAndRemoveUntil('/main', (router) => false);
  }

  @override
  void dispose() {
    super.dispose();
  }
}