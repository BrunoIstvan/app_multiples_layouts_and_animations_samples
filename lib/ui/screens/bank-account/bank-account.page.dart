import 'package:app_multiple_layouts_and_animations/ui/screens/bank-account/app-drawer.widget.dart';
import 'package:flutter/material.dart';

class BankAccountPage extends StatefulWidget {
  @override
  BankAccountStatePage createState() => BankAccountStatePage();
}

class BankAccountStatePage extends State<BankAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: _buildAppBar(context),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Container _buildBody() {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          _buildTopArea(),
          _buildRefreshSection(),
          _displayAccoutList(),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.blue, //change your color here
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: Text(
        "Accounts",
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search, color: Colors.blue),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}

Widget _displayAccoutList() {
  return Container(
    margin: EdgeInsets.all(15.0),
    child: Column(
      children: <Widget>[
        _accountItems("Trevello App", r"+ $ 4,946.00", "28-04-16", "Credit",
            oddColour: const Color(0xFFF7F7F9)),
        _accountItems(
            "Creative Studios", r"+ $ 5,428.00", "26-04-16", "Credit"),
        _accountItems("Amazon EU", r"+ $ 746.00", "25-04-216", "Payment",
            oddColour: const Color(0xFFF7F7F9)),
        _accountItems(
            "Creative Studios", r"+ $ 14,526.00", "16-04-16", "Payment"),
        _accountItems("Book Hub Society", r"+ $ 2,876.00", "04-04-16", "Credit",
            oddColour: const Color(0xFFF7F7F9)),
      ],
    ),
  );
}

Widget _accountItems(String item, String charge, String dateString, String type,
        {Color oddColour = Colors.white}) =>
    Container(
      decoration: BoxDecoration(color: oddColour),
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0, left: 5.0, right: 5.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                item,
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                charge,
                style: TextStyle(fontSize: 16.0),
              )
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                dateString,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
              ),
              Text(
                type,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
              )
            ],
          ),
        ],
      ),
    );

Widget _buildRefreshSection() {
  return SizedBox(
    height: 40.0,
    child: Icon(
      Icons.refresh,
      size: 35.0,
      color: Color(0xFF015FFF),
    ),
  );
}

Card _buildTopArea() => Card(
      margin: EdgeInsets.all(10.0),
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(50.0),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Color(0xFF015FFF), Color(0xFF015FFF)],
          ),
        ),
        padding: EdgeInsets.all(5.0),
        // color: Color(0xFF015FFF),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {},
                ),
                Text(
                  "Savings",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward, color: Colors.white),
                  onPressed: () {},
                )
              ],
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  r"$ " "95,940.00",
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                ),
              ),
            ),
            SizedBox(height: 35.0),
          ],
        ),
      ),
    );

Widget _buildBottomNavigationBar() => BottomAppBar(
      elevation: 0.0,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FlatButton(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0)),
              color: Color(0xFF015FFF),
              // borderSide: BorderSide(color: Color(0xFF015FFF), width: 1.0),
              onPressed: () {},
              child: Text(
                "ACTIVITY",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            OutlineButton(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 28.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0)),
              borderSide: BorderSide(color: Color(0xFF015FFF), width: 1.0),
              onPressed: () {},
              child: Text("STATEMENTS"),
            ),
            OutlineButton(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 28.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0)),
              borderSide: BorderSide(color: Color(0xFF015FFF), width: 1.0),
              onPressed: () {},
              child: Text("DETAILS"),
            )
          ],
        ),
      ),
    );
