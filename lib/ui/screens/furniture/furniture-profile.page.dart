import 'package:app_multiple_layouts_and_animations/ui/screens/furniture/widgets/profile/profile_categories.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/furniture/widgets/profile/profile_detail.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/furniture/widgets/profile/profile_menu.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/furniture/widgets/title_large.dart';
import 'package:flutter/material.dart';

class FurnitureProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 30.0,
        ),
        child: Column(
          //mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            TitleLarge(title: 'Center'),
            SizedBox(height: 20.0),
            ProfileDetail(),
            SizedBox(height: 30.0),
            ProfileCategories(),
            SizedBox(height: 30.0),
            Flexible(child: ProfileMenu()),
          ],
        ),
      ),
    );
  }
}
