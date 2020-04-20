import 'package:app_multiple_layouts_and_animations/ui/screens/animations/animation-sample.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/layout-section/layout-section.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/texty-navigation/texty-navigation.page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Demo')),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Drawer Header'),
                  SizedBox(height: 10),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        'https://res.cloudinary.com/app-beleza-da-mulher/image/upload/v1586527724/user_avatar/5_1586527722789.jpg'),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            _listTile(
                context: context,
                text: 'Layout Section Page',
                builder: (_) => LayoutSectionPage()),
            _listTile(
                context: context,
                text: 'Animations',
                builder: (_) => AnimationSamplePage()),
            _listTile(
                context: context,
                text: 'Texty Navigator',
                builder: (_) => TextyNavigationPage()),
          ],
        ),
      ),
    );
  }
}

Widget _listTile({BuildContext context, String text, WidgetBuilder builder}) {
  return ListTile(
    title: Text(text),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: builder,
        ),
      );
    },
  );
}
