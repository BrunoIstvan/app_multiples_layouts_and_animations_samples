import 'package:app_multiple_layouts_and_animations/ui/screens/momments-app/models/rich-list-item-card.model.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/momments-app/models/rich-list-item.model.dart';
import 'package:flutter/material.dart';

class RichList extends StatelessWidget {
  RichList(this.listItems);

  final List<RichListItem> listItems;

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(BuildContext context) {
    return ListView.builder(
      itemCount: listItems.length,
      itemBuilder: (BuildContext context, int index) {
        return RichListItemCard(listItems[index]);
      },
    );
  }
}
