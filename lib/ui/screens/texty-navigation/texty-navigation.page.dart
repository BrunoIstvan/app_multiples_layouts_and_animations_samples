import 'package:flutter/material.dart';

class TextyNavigationPage extends StatefulWidget {
  @override
  _TextyNavigationPageState createState() => _TextyNavigationPageState();
}

class _TextyNavigationPageState extends State<TextyNavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Texty Navigation"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(55, 113, 170, 1.0)),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Expanded(
                child: _makeProfileAvatar(),
                flex: 1,
              ),
              Expanded(
                child: _menuGrid(context),
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _makeProfileAvatar() {
  return Column(
    children: <Widget>[
      // SizedBox(height: 10.0),
      CircleAvatar(
        radius: 60.0,
        backgroundImage: NetworkImage(
            'https://res.cloudinary.com/app-beleza-da-mulher/image/upload/v1586527724/user_avatar/5_1586527722789.jpg'),
      ),
      SizedBox(height: 20.0),
      Center(
        child: new Text("Bruno Istvan",
            style: new TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
      Center(
        child: new Text("São Paulo, Brasil",
            style: new TextStyle(
                fontSize: 18.0,
                color: Colors.white70,
                fontWeight: FontWeight.normal)),
      )
    ],
  );
}

Column _makeMenuItem(BuildContext context, IconData icon, String title) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      verticalDirection: VerticalDirection.down,
      children: <Widget>[
        Center(
            child: Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        )),
        SizedBox(height: 10.0),
        new Center(
          child: new Text(title,
              style: new TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        )
      ],
    );

GridView _menuGrid(BuildContext context) => GridView.count(
      crossAxisCount: 2,
      children: <Widget>[
        _makeMenuItem(context, Icons.message, "Messages"),
        _makeMenuItem(context, Icons.phone_forwarded, "Calls"),
        _makeMenuItem(context, Icons.dialpad, "Dial"),
        _makeMenuItem(context, Icons.contacts, "Contacts"),
        _makeMenuItem(context, Icons.more_horiz, "More"),
        _makeMenuItem(context, Icons.settings, "Settings"),
      ],
    );
