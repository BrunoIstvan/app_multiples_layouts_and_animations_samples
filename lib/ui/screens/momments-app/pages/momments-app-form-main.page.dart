import 'package:app_multiple_layouts_and_animations/ui/screens/momments-app/models/main.model.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/momments-app/models/menu-item.model.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/momments-app/pages/momments-app-form.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/momments-app/pages/momments-app-list-item.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/momments-app/pages/momments-app-login.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/momments-app/pages/momments-app-richlist.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/momments-app/utils/momments-app-colors.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class MommentsAppFormMainPage extends StatefulWidget {
  final MainModel model;

  MommentsAppFormMainPage(this.model);

  @override
  _MommentsAppFormMainPageState createState() =>
      _MommentsAppFormMainPageState();
}

class _MommentsAppFormMainPageState extends State<MommentsAppFormMainPage> {
  MenuItem selectedMenuItem = MenuItem.form;

  List<Widget> _buildMenuItems(MainModel model) {
    final List<String> images = [
      'assets/menu_form.png',
      'assets/menu_list.png',
      'assets/menu_richList.png'
    ];

    final List<String> menuTitles = ['Form', 'List', 'RichList'];

    final List<MenuItem> menuItems = [
      MenuItem.form,
      MenuItem.list,
      MenuItem.richList
    ];

    final List<Widget> columnItems = List<Widget>();

    for (var i = 0; i < menuTitles.length; i++) {
      bool isSelectedMenuItem = selectedMenuItem == menuItems[i];
      columnItems.add(
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            ),
            border: Border.all(
              color: isSelectedMenuItem ? kRegistrationBlack : Colors.white,
            ),
          ),
          child: InkWell(
            onTap: () {
              setState(() {
                selectedMenuItem = menuItems[i];
              });
            },
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage(images[i]),
                    height: 40,
                    width: 40,
                    color: kRegistrationBlack,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      menuTitles[i],
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    return columnItems;
  }

  Widget _getPage(MainModel model) {
    switch (selectedMenuItem) {
      case MenuItem.form:
        return MommentsAppFormPage();
      case MenuItem.list:
        return MommentsAppItemListPage(model);
      case MenuItem.richList:
        return MommentsAppRichListPage();
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    final MainModel _model = ScopedModel.of(context);

    return Scaffold(
      backgroundColor: kMomentsWhite,
      appBar: _buildAppBar(context, _model),
      body: _buildBody(_model, context),
    );
  }

  Column _buildBody(MainModel _model, BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
          child: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _buildMenuItems(_model),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(
            "Hello ${_model.user.name}!",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Expanded(child: _getPage(_model))
      ],
    );
  }

  AppBar _buildAppBar(BuildContext context, MainModel _model) {
    return AppBar(
      centerTitle: true,
      title: Text('Menu', style: Theme.of(context).textTheme.headline5),
      backgroundColor: Colors.white,
      elevation: 0.0,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            _model.logout();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) {
                  return MommentsAppLoginPage(_model);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
