import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.0,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 40),
            // Padding(
            //   padding: EdgeInsets.only(top: 10.0),
            //   child: FlatButton.icon(
            //     icon: Icon(Icons.arrow_back, color: Color(0xFF015FFF)),
            //     onPressed: null,
            //     label: Text("Back",
            //         style: TextStyle(
            //             fontWeight: FontWeight.w400,
            //             fontSize: 16.0,
            //             color: Colors.black)),
            //     color: Colors.black,
            //   ),
            // ),
            _buildMenuItem(Icons.account_balance, "ACCOUNTS",
                opacity: 1.0, color: Color(0xFF015FFF)),
            Divider(),
            _buildMenuItem(Icons.compare_arrows, "TRANSFER"),
            Divider(),
            _buildMenuItem(Icons.receipt, "STATEMENTS"),
            Divider(),
            _buildMenuItem(Icons.attach_money, "PAYMENTS"),
            Divider(),
            _buildMenuItem(Icons.sentiment_satisfied, "INVESTMENTS"),
            Divider(),
            _buildMenuItem(Icons.phone, "SUPPORT"),
            Divider()
          ],
        ),
      ),
    );
  }
}

Opacity _buildMenuItem(IconData icon, String title,
        {double opacity = 0.3, Color color = Colors.black}) =>
    Opacity(
      opacity: opacity,
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            Icon(icon, size: 50.0, color: color),
            SizedBox(height: 10.0),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
                color: color,
              ),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
