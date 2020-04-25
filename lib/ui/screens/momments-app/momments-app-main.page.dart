import 'package:app_multiple_layouts_and_animations/ui/screens/momments-app/models/main.model.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/momments-app/pages/momments-app-login.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/momments-app/utils/momments-app-themes.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

final ThemeData _kMomentsTheme = MomentsTheme().data;

class MommentsAppMainPage extends StatefulWidget {
  @override
  _MommentsAppMainPageState createState() => _MommentsAppMainPageState();
}

// desenvolver https://github.com/lawreyios/FlutterMoments.git

class _MommentsAppMainPageState extends State<MommentsAppMainPage> {
  final MainModel _model = MainModel();

  Widget _defaultHome;

  @override
  void initState() {
    _defaultHome = MommentsAppLoginPage(_model);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: _model,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Moments',
        home: _defaultHome,
        // routes: <String, WidgetBuilder>{
        //   '/home': (BuildContext context) => GalleryPage(),
        //   '/login': (BuildContext context) => LoginPage(_model)
        // },
        theme: _kMomentsTheme,
      ),
    );
  }
}
