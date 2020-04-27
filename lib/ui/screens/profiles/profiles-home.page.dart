import 'package:app_multiple_layouts_and_animations/ui/screens/profiles/profile-sample1.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/profiles/profile-sample2.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/profiles/profile-sample3.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/profiles/profile-sample4.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/profiles/profile-sample5.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/profiles/profile-sample6.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/profiles/profile-sample7.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/profiles/profile-sample8.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/profiles/profile-sample9.page.dart';
import 'package:flutter/material.dart';

class ProfileHomePage extends StatefulWidget {
  @override
  _ProfileHomePageState createState() => _ProfileHomePageState();
}

class _ProfileHomePageState extends State<ProfileHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  Center _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildDefaultButton('Sample Profile 1', ProfileSample1Page()),
          _buildDefaultButton('Sample Profile 2', ProfileSample2Page()),
          _buildDefaultButton('Sample Profile 3', ProfileSample3Page()),
          _buildDefaultButton('Sample Profile 4', ProfileSample4Page()),
          _buildDefaultButton('Sample Profile 5', ProfileSample5Page()),
          _buildDefaultButton('Sample Profile 6', ProfileSample6Page(dev: sid)),
          _buildDefaultButton('Sample Profile 7', ProfileSample7Page()),
          _buildDefaultButton('Sample Profile 8', ProfileSample8Page()),
          _buildDefaultButton('Sample Profile 9', ProfileSample9Page()),
        ],
      ),
    );
  }

  RaisedButton _buildDefaultButton(String text, Widget widget) {
    return RaisedButton(
      child: Text(text),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => widget,
          ),
        );
      },
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return new AppBar(
      title: new Text("Profiles Samples"),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
    );
  }
}
