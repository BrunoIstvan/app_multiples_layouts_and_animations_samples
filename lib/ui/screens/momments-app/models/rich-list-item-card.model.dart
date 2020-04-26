import 'package:app_multiple_layouts_and_animations/ui/screens/momments-app/models/rich-list-item.model.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/momments-app/utils/momments-app-colors.dart';
import 'package:flutter/material.dart';

class RichListItemCard extends StatefulWidget {
  final RichListItem item;

  RichListItemCard(this.item);

  @override
  _RichListItemCardState createState() => _RichListItemCardState(item);
}

class _RichListItemCardState extends State<RichListItemCard> {
  RichListItem item;

  _RichListItemCardState(this.item);

  String renderUrl;

  Widget get _itemImage {
    return Container(
      width: 125.0,
      height: 125.0,
      decoration: BoxDecoration(
        border: Border.all(color: kPlatinum),
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(item.imagePath),
        ),
      ),
    );
  }

  Widget get _listItemCard {
    return Padding(
      padding: EdgeInsets.only(top: 18, bottom: 16),
      child: Container(
        constraints: BoxConstraints(minWidth: 340),
        height: 130.0,
        child: Card(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: kPlatinum, width: 1.0),
            borderRadius: BorderRadius.circular(4.0),
          ),
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 8.0,
              left: 95.0,
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    widget.item.name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    widget.item.description,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        height: 150.0,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 45.0,
              child: _listItemCard,
            ),
            Positioned(top: 20.5, child: _itemImage),
          ],
        ),
      ),
    );
  }
}