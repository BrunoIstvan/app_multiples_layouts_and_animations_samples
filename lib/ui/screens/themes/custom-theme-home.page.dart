import 'package:app_multiple_layouts_and_animations/ui/screens/themes/themes.const.dart';
import 'package:flutter/material.dart';

class CustomThemeHomePage extends StatefulWidget {
  final MyThemeKeys themeKey;

  CustomThemeHomePage({this.themeKey});
  @override
  _CustomThemeHomePageState createState() => _CustomThemeHomePageState();
}

class _CustomThemeHomePageState extends State<CustomThemeHomePage> {
  ThemeData _theme;

  @override
  void initState() {
    super.initState();
    _changeTheme(context, widget.themeKey);
  }

  void _changeTheme(BuildContext buildContext, MyThemeKeys key) {
    setState(() {
      _theme = MyThemes.getThemeFromKey(key);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _theme,
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(context),
      ),
    );
  }

  Padding _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                _changeTheme(context, MyThemeKeys.LIGHT);
              },
              child: Text("Light!"),
            ),
            RaisedButton(
              onPressed: () {
                _changeTheme(context, MyThemeKeys.DARK);
              },
              child: Text("Dark!"),
            ),
            RaisedButton(
              onPressed: () {
                _changeTheme(context, MyThemeKeys.DARKER);
              },
              child: Text("Darker!"),
            ),
            Divider(
              height: 100,
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              color: _theme.primaryColor,
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: _theme.primaryColor,
      title: Text("Custom Theme"),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
