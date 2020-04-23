import 'package:app_multiple_layouts_and_animations/ui/screens/tabview/first.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/tabview/second.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/tabview/third.page.dart';
import 'package:flutter/material.dart';

class TabViewPage extends StatefulWidget {
  @override
  _TabViewPageState createState() => _TabViewPageState();
}

class _TabViewPageState extends State<TabViewPage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Pages"),
        backgroundColor: Colors.deepOrange,
        bottom: new TabBar(
          controller: controller,
          tabs: <Tab>[
            new Tab(icon: new Icon(Icons.arrow_forward)),
            new Tab(icon: new Icon(Icons.arrow_downward)),
            new Tab(icon: new Icon(Icons.arrow_back))
          ],
        ),
      ),
      bottomNavigationBar: new Material(
        color: Colors.deepOrange,
        child: new TabBar(
          controller: controller,
          tabs: <Tab>[
            new Tab(icon: new Icon(Icons.arrow_forward)),
            new Tab(icon: new Icon(Icons.arrow_downward)),
            new Tab(icon: new Icon(Icons.arrow_back))
          ],
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[FirstPage(), SecondPage(), ThirdPage()],
      ),
    );
  }
}
