import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  Container _buildBody() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
      child: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(3.0),
        children: <Widget>[
          _makeDashboardItem("Ordbog", Icons.book),
          _makeDashboardItem("Alphabet", Icons.alarm),
          _makeDashboardItem("Alphabet", Icons.alarm),
          _makeDashboardItem("Alphabet", Icons.alarm),
          _makeDashboardItem("Alphabet", Icons.alarm),
          _makeDashboardItem("Alphabet", Icons.alarm)
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text("INDHOLD"),
      elevation: .1,
      backgroundColor: Color.fromRGBO(49, 87, 110, 1.0),
    );
  }

  Widget _makeDashboardItem(String title, IconData icon) => Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                  child: Icon(
                    icon,
                    size: 40.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(
                    title,
                    style: new TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
