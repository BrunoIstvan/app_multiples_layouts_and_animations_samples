import 'package:app_multiple_layouts_and_animations/ui/screens/furniture/utils/constant.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/furniture/widgets/furniture/bottomItem.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/furniture/widgets/furniture/furniture_category.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/furniture/widgets/furniture/item_navigation.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/furniture/widgets/furniture/lamp.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/furniture/widgets/title_large.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/furniture/widgets/title_small.dart';
import 'package:flutter/material.dart';

class FurnitureDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Size deviceSize = MediaQuery.of(context).size;
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 0.0,
              ),
              child: TitleLarge(
                title: 'Furniture',
                icon: Icons.add_shopping_cart,
              ),
            ),
            buildFurnitureCategories,
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: TitleSmall(
                subTitle: 'Good quality item',
                title: 'Modern',
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            buildLampsWithSlider(),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: TitleSmall(
                subTitle: 'In recent month',
                title: 'Popular',
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            BottomItem(),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }

  Container buildLampsWithSlider() {
    return Container(
      //color: Colors.yellow,
      height: 350,
      child: Stack(
        children: <Widget>[
          buildLamps,
          Positioned(
            bottom: 40.0,
            right: 50.0,
            child: ItemNavigation(),
          )
        ],
      ),
    );
  }

  final buildLamps = ListView.builder(
    scrollDirection: Axis.horizontal,
    physics: BouncingScrollPhysics(),
    shrinkWrap: true,
    itemCount: lampList.length,
    itemBuilder: (context, int index) => Lamp(
      item: lampList[index],
      index: index,
    ),
  );
  final buildFurnitureCategories = Container(
    height: 100.0,
    //color: Colors.red,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: furnitureCategoriesList.length,
      itemBuilder: (context, int index) => FurnitureCategory(
        item: furnitureCategoriesList[index],
      ),
    ),
  );
}
