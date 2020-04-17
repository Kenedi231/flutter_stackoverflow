import 'package:flutter/material.dart';
import 'package:infinity_list/core/viewmodels/screens/main_screen_view_model.dart';
import 'package:infinity_list/ui/shared/main_view_model_provider.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    // Future.microtask(() {
    //   if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
    //     Provider.of<MainScreenViewModel>(context, listen: false).getPosts();
    //   }
    // });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // final _viewModel = Provider.of<MainScreenViewModel>(context);
  }

  @override
  Widget build(BuildContext context) {
    return MainViewModelProvider<MainScreenViewModel>(
      model: MainScreenViewModel(context: context),
      builder: (MainScreenViewModel model) {
        _scrollController.addListener(() {
          if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
            model.getPosts();
          }
        });
        return Consumer<MainScreenViewModel>(
          builder: (context, model, child) => Scaffold(
            backgroundColor: Colors.white,
            body: ListView.builder(
              controller: _scrollController,
              itemCount: model.posts.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    subtitle: Text(model.posts[index]['title']),
                    title: Text(model.posts[index]['title']),
                    selected: true,
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