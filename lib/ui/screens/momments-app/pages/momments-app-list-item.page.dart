import 'package:app_multiple_layouts_and_animations/ui/screens/momments-app/models/list-item.model.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/momments-app/models/main.model.dart';
import 'package:flutter/material.dart';

class MommentsAppItemListPage extends StatefulWidget {
  final MainModel model;

  MommentsAppItemListPage(this.model);

  @override
  _ItemListPageState createState() => _ItemListPageState();
}

class _ItemListPageState extends State<MommentsAppItemListPage> {
  List<ListItem> _itemList = [];

  @override
  initState() {
    _itemList = widget.model.fetchItemList();
    super.initState();
  }

  Widget _buildItemList() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: <Widget>[
            Padding(
              child: ListTile(
                title: Text(
                  _itemList[index].title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                subtitle: Text(
                  _itemList[index].subtitle,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
              padding: EdgeInsets.all(10.0),
            ),
            Divider(height: 5.0),
          ],
        );
      },
      itemCount: _itemList.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildItemList());
  }
}
