import 'package:app_multiple_layouts_and_animations/ui/screens/animations/animation-sample.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/bank-account/bank-account.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/beatiful-list/beautiful-list.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/contactly-app/contactly-login.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/crypto-wallet/crypto-wallet.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/cuisine/cuisine.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/dashboard/dashboard.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/friendly-chat/friendly-chat.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/horizontal-list-tab/horizontal-list-tab.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/layout-section/layout-section.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/login-sample/login-sample.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/momments-app/momments-app-main.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/succesful-purchase/succesful-purchase.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/tabview/tabview.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/texty-navigation/texty-navigation.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/walkthrougth/welcome.page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String mainProfilePicture =
      "https://randomuser.me/api/portraits/women/44.jpg";

  String otherProfilePicture =
      "https://randomuser.me/api/portraits/women/47.jpg";

  _switchUser() {
    String backupString = mainProfilePicture;
    this.setState(() {
      mainProfilePicture = otherProfilePicture;
      otherProfilePicture = backupString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Demo')),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            _buildUserAccountsDrawerHeader(),
            //
            // _buildDrawerHeader(),
            // SizedBox(height: 30),
            //
            _listTile(
              context: context,
              text: 'Cuisine Top',
              builder: (_) => CuisinePage(),
            ),
            _listTile(
              context: context,
              text: 'Login 1 Top',
              builder: (_) => LoginSamplePage(),
            ),
            _listTile(
              context: context,
              text: 'Animations Top',
              builder: (_) => AnimationSamplePage(),
            ),
            _listTile(
              context: context,
              text: 'Contactly Top',
              builder: (_) => ContactlyLoginPage(),
            ),
            _listTile(
              context: context,
              text: 'Momments Top',
              builder: (_) => MommentsAppMainPage(),
            ),
            _listTile(
              context: context,
              text: 'Horizontal List Top',
              builder: (_) => HorizontalListTabPage(),
            ),
            _listTile(
              context: context,
              text: 'Layout Section Page',
              builder: (_) => LayoutSectionPage(),
            ),
            _listTile(
              context: context,
              text: 'Friendly Chat',
              builder: (_) => FriendlyChatPage(),
            ),
            _listTile(
              context: context,
              text: 'Texty Navigator',
              builder: (_) => TextyNavigationPage(),
            ),
            _listTile(
              context: context,
              text: 'Succesful Purchase',
              builder: (_) => SuccesfulPurchasePage(),
            ),
            _listTile(
              context: context,
              text: 'Crypto Wallet',
              builder: (_) => CryptoWalletPage(),
            ),
            _listTile(
              context: context,
              text: 'Bank Account',
              builder: (_) => BankAccountPage(),
            ),
            _listTile(
              context: context,
              text: 'Walkthrough',
              builder: (_) => WelcomePage(),
            ),
            _listTile(
              context: context,
              text: 'Dashboard',
              builder: (_) => DashboardPage(),
            ),
            _listTile(
              context: context,
              text: 'Beautiful List',
              builder: (_) => BeautifulListPage(title: 'Lessons'),
            ),
            _listTile(
              context: context,
              text: 'TabView',
              builder: (_) => TabViewPage(),
            ),
          ],
        ),
      ),
    );
  }

  // DrawerHeader _buildDrawerHeader() {
  //   return DrawerHeader(
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Text('Drawer Header'),
  //         SizedBox(height: 10),
  //         CircleAvatar(
  //           radius: 40,
  //           backgroundImage: AssetImage('assets/avatar.jpg'),
  //         ),
  //       ],
  //     ),
  //     decoration: BoxDecoration(
  //       color: Colors.blue,
  //     ),
  //   );
  // }

  UserAccountsDrawerHeader _buildUserAccountsDrawerHeader() =>
      UserAccountsDrawerHeader(
        accountName: new Text("Raunak Hajela"),
        accountEmail: new Text("raunakhajela@gmail.com"),
        currentAccountPicture: new GestureDetector(
          onTap: _switchUser,
          child: new CircleAvatar(
            backgroundImage: new NetworkImage(mainProfilePicture),
          ),
        ),
        otherAccountsPictures: <Widget>[
          new GestureDetector(
            onTap: () => print("this is the other user"),
            child: new CircleAvatar(
              backgroundImage: new NetworkImage(otherProfilePicture),
            ),
          ),
        ],
        decoration: new BoxDecoration(
          image: new DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("background_header.jpg"),
          ),
        ),
      );
}

Widget _listTile({BuildContext context, String text, WidgetBuilder builder}) {
  return ListTile(
    title: Text(text),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: builder),
      );
    },
  );
}
