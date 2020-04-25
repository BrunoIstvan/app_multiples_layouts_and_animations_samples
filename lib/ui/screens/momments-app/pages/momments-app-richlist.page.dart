import 'package:app_multiple_layouts_and_animations/ui/screens/momments-app/models/rich-list-item.model.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/momments-app/models/rich-list.model.dart';
import 'package:flutter/material.dart';

class MommentsAppRichListPage extends StatelessWidget {
  final List<RichListItem> _list = [
    RichListItem(
        name: 'Scenery',
        description: 'Waterfall',
        imagePath: 'assets/pic1.jpg'),
    RichListItem(
        name: 'Iconic',
        description: 'Lighthouse',
        imagePath: 'assets/pic2.jpg'),
    RichListItem(
        name: 'Wild Life',
        description: 'Ostrich',
        imagePath: 'assets/pic3.jpg'),
    RichListItem(
        name: 'Surreal',
        description: 'Rain & Sea',
        imagePath: 'assets/pic4.jpg'),
    RichListItem(
        name: 'Symmetry', description: 'Deadend', imagePath: 'assets/pic5.jpg')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RichList(_list),
    );
  }
}
