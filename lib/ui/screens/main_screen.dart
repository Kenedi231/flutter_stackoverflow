import 'package:flutter/material.dart';
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinity_list/core/viewmodels/screens/main_screen_view_model.dart';
import 'package:infinity_list/ui/shared/main_view_model_provider.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  ScrollController _scrollController = new ScrollController();
  var update = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final _viewModel = Provider.of<MainScreenViewModel>(context, listen: false);
      
      _scrollController.addListener(() {
        if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
          _viewModel.getPosts();
        }
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final _viewModel = Provider.of<MainScreenViewModel>(context, listen: false);
 
    _viewModel.getPosts();
  }

  void logout() async {
    await FlutterKeychain.remove(key: 'user');
    Navigator.of(context).pushNamedAndRemoveUntil('/auth', (router) => false);
  }

  @override
  Widget build(BuildContext context) {
    return MainViewModelProvider<MainScreenViewModel>(
      builder: (MainScreenViewModel model) {
        return Consumer<MainScreenViewModel>(
          builder: (context, model, child) => Scaffold(
            backgroundColor: Colors.grey[900],
            body: ListView.builder(
              controller: _scrollController,
              itemCount: model.posts.length + 1,
              itemBuilder: (BuildContext context, int index) {
                return (index != model.posts.length) ?
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(model.posts[index]['API']),
                            subtitle: Text(model.posts[index]['Description']),
                            selected: true,
                          ),
                          ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                child: Text(model.posts[index]['Category']),
                                onPressed: logout,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ) : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: SpinKitWave(
                      color: Colors.blueAccent,
                      size: 30.0,
                    ),
                  );
              },
            ),
          ),
        );
      },
    );
  }
}