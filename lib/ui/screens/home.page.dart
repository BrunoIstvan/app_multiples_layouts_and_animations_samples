import 'package:app_multiple_layouts_and_animations/ui/screens/animations/animation-sample.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/bank-account/bank-account.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/beatiful-list/beautiful-list.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/crypto-wallet/crypto-wallet.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/dashboard/dashboard.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/layout-section/layout-section.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/login-sample/login-sample.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/succesful-purchase/succesful-purchase.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/texty-navigation/texty-navigation.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/walkthrougth/welcome.page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Demo')),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Drawer Header'),
                  SizedBox(height: 10),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/avatar.jpg'),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            _listTile(
                context: context,
                text: 'Login Sample 1',
                builder: (_) => LoginSamplePage()),
            _listTile(
                context: context,
                text: 'Layout Section Page',
                builder: (_) => LayoutSectionPage()),
            _listTile(
                context: context,
                text: 'Animations',
                builder: (_) => AnimationSamplePage()),
            _listTile(
                context: context,
                text: 'Texty Navigator',
                builder: (_) => TextyNavigationPage()),
            _listTile(
                context: context,
                text: 'Succesful Purchase',
                builder: (_) => SuccesfulPurchasePage()),
            _listTile(
                context: context,
                text: 'Crypto Wallet',
                builder: (_) => CryptoWalletPage()),
            _listTile(
                context: context,
                text: 'Bank Account',
                builder: (_) => BankAccountPage()),
            _listTile(
                context: context,
                text: 'Walkthrough',
                builder: (_) => WelcomePage()),
            _listTile(
                context: context,
                text: 'Dashboard',
                builder: (_) => DashboardPage()),
            _listTile(
                context: context,
                text: 'Beautiful List',
                builder: (_) => BeautifulListPage(title: 'Lessons')),
          ],
        ),
      ),
    );
  }
}

Widget _listTile({BuildContext context, String text, WidgetBuilder builder}) {
  return ListTile(
    title: Text(text),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: builder,
        ),
      );
    },
  );
}
