import 'package:app_multiple_layouts_and_animations/ui/screens/contactly-app/contac-list.model.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/contactly-app/contact-detail.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/contactly-app/contact.model.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/contactly-app/contactly-app-constants.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/contactly-app/contactly.service.dart';
import 'package:flutter/material.dart';

class ContactlyHomePage extends StatefulWidget {
  @override
  _ContactlyHomePageState createState() => _ContactlyHomePageState();
}

class _ContactlyHomePageState extends State<ContactlyHomePage> {
  final TextEditingController _filter = new TextEditingController();

  ContactModelList _records = new ContactModelList();
  ContactModelList _filteredRecords = new ContactModelList();
  String _searchText = "";
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text(appTitle);

  @override
  void initState() {
    super.initState();

    _records.records = new List();
    _filteredRecords.records = new List();

    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          _resetRecords();
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });

    _getRecords();
  }

  _resetRecords() {
    this._filteredRecords.records = new List();

    for (ContactModel record in _records.records) {
      this._filteredRecords.records.add(record);
    }
  }

  _getRecords() async {
    ContactModelList records = await ContactlyService().loadRecords();

    setState(() {
      for (ContactModel record in records.records) {
        this._records.records.add(record);
        this._filteredRecords.records.add(record);
      }
    });
  }

  _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          style: new TextStyle(color: Colors.white),
          decoration: new InputDecoration(
            prefixIcon: new Icon(Icons.search, color: Colors.white),
            fillColor: Colors.white,
            hintText: 'Search by name',
            hintStyle: TextStyle(color: Colors.white),
          ),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text(appTitle);
        _filter.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor: appDarkGreyColor,
      body: _buildList(context),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return new AppBar(
      elevation: 0.1,
      backgroundColor: appDarkGreyColor,
      centerTitle: true,
      title: _appBarTitle,
      leading: new IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: _searchIcon,
          onPressed: _searchPressed,
        ),
      ],
    );
  }

  Widget _buildList(BuildContext context) {
    if ((_searchText.isNotEmpty)) {
      _filteredRecords.records = new List();
      for (int i = 0; i < _records.records.length; i++) {
        if (_records.records[i].name
                .toLowerCase()
                .contains(_searchText.toLowerCase()) ||
            _records.records[i].address
                .toLowerCase()
                .contains(_searchText.toLowerCase())) {
          _filteredRecords.records.add(_records.records[i]);
        }
      }
    }

    return ListView(
      //padding: const EdgeInsets.only(top: 20.0),
      children: this
          ._filteredRecords
          .records
          .map((data) => _buildListItem(context, data))
          .toList(),
    );
  }

  Widget _buildListItem(BuildContext context, ContactModel record) {
    return Card(
      key: ValueKey(record.name),
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(64, 75, 96, .9),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
              border: new Border(
                right: new BorderSide(
                  width: 1.0,
                  color: Colors.white24,
                ),
              ),
            ),
            child: Hero(
              tag: "avatar_" + record.name,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(record.photo),
              ),
            ),
          ),
          title: Text(
            record.name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: <Widget>[
              new Flexible(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: record.address,
                        style: TextStyle(color: Colors.white),
                      ),
                      maxLines: 3,
                      softWrap: true,
                    )
                  ],
                ),
              ),
            ],
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
            size: 30.0,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => new ContactDetailPage(record: record),
              ),
            );
          },
        ),
      ),
    );
  }
}
