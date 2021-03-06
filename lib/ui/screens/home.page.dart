import 'package:app_multiple_layouts_and_animations/ui/screens/animations-part-two/animations-part-two-home.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/animations/animation-sample.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/audioplayer/audioplayer.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/bank-account/bank-account.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/beatiful-list/beautiful-list.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/contactly-app/contactly-login.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/crypto-wallet/crypto-wallet.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/cuisine/cuisine.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/dashboard/dashboard.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/friendly-chat/friendly-chat.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/furniture/furniture-detail.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/furniture/furniture-profile.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/horizontal-list-tab/horizontal-list-tab.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/layout-section/layout-section.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/list-refresh/refresh-list.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/login-sample/login-sample.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/momments-app/momments-app-main.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/profiles/profiles-home.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/succesful-purchase/succesful-purchase.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/tabview/tabview.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/texty-navigation/texty-navigation.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/themes/custom-theme-home.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/themes/themes.const.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/videoplayer/videoplayer.page.dart';
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

  final GlobalKey<ScaffoldState> _scaffoldState =
      new GlobalKey<ScaffoldState>();

  void _showBar() {
    Scaffold.of(context)
        .showSnackBar(new SnackBar(content: new Text('Hello World')));
  }

  _switchUser() {
    String backupString = mainProfilePicture;
    this.setState(() {
      mainProfilePicture = otherProfilePicture;
      otherProfilePicture = backupString;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _listTile({String text, WidgetBuilder builder}) => ListTile(
          title: Text(text),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: builder),
            );
          },
        );

    return Scaffold(
      key: _scaffoldState,
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
              text: 'Cuisine Top',
              builder: (_) => CuisinePage(),
            ),
            _listTile(
              text: 'Login 1 Top',
              builder: (_) => LoginSamplePage(),
            ),
            _listTile(
              text: 'Animations Top',
              builder: (_) => AnimationSamplePage(),
            ),
            _listTile(
              text: 'Animations 2 Top',
              builder: (_) => AnimationsParte2HomePage(),
            ),
            _listTile(
              text: 'Contactly Top',
              builder: (_) => ContactlyLoginPage(),
            ),
            _listTile(
              text: 'Momments Top',
              builder: (_) => MommentsAppMainPage(),
            ),
            _listTile(
              text: 'Horizontal List Top',
              builder: (_) => HorizontalListTabPage(),
            ),
            _listTile(
              text: 'Profiles Top',
              builder: (_) => ProfileHomePage(),
            ),
            _listTile(
              text: 'Forniture Profile Top',
              builder: (_) => FurnitureProfilePage(),
            ),
            _listTile(
              text: 'Forniture Detail Top',
              builder: (_) => FurnitureDetailPage(),
            ),
            _listTile(
              text: 'VideoPlayer',
              builder: (_) => VideoPlayerPage(),
            ),
            _listTile(
              text: 'AudioPlayer',
              builder: (_) => AudioPlayerPage(),
            ),
            _listTile(
              text: 'Layout Section Page',
              builder: (_) => LayoutSectionPage(),
            ),
            _listTile(
              text: 'Refresh List',
              builder: (_) => RefreshListPage(),
            ),
            _listTile(
              text: 'Friendly Chat',
              builder: (_) => FriendlyChatPage(),
            ),
            _listTile(
              text: 'Custom Theme',
              builder: (_) => CustomThemeHomePage(themeKey: MyThemeKeys.LIGHT),
            ),
            _listTile(
              text: 'Texty Navigator',
              builder: (_) => TextyNavigationPage(),
            ),
            _listTile(
              text: 'Succesful Purchase',
              builder: (_) => SuccesfulPurchasePage(),
            ),
            _listTile(
              text: 'Crypto Wallet',
              builder: (_) => CryptoWalletPage(),
            ),
            _listTile(
              text: 'Bank Account',
              builder: (_) => BankAccountPage(),
            ),
            _listTile(
              text: 'Walkthrough',
              builder: (_) => WelcomePage(),
            ),
            _listTile(
              text: 'Dashboard',
              builder: (_) => DashboardPage(),
            ),
            _listTile(
              text: 'Beautiful List',
              builder: (_) => BeautifulListPage(title: 'Lessons'),
            ),
            _listTile(
              text: 'TabView',
              builder: (_) => TabViewPage(),
            ),
          ],
        ),
      ),
      persistentFooterButtons: <Widget>[
        new IconButton(
          icon: new Icon(Icons.timer),
          onPressed: _showBottom,
        ),
        new IconButton(
          icon: new Icon(Icons.people),
          onPressed: () => _showBar,
        ),
        new IconButton(
          icon: new Icon(Icons.map),
          onPressed: () => print('Button3'),
        ),
      ],
    );
  }

  void _showBottom() {
    showModalBottomSheet<void>(
      context: context,
      /*bottom sheet is like a drawer that pops off where you can put any
      controls you want, it is used typically for user notifications*/
      //builder lets your code generate the code
      builder: (BuildContext context) {
        return new Container(
          padding: new EdgeInsets.all(15.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                'Some info here',
                style: new TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              new FlatButton(
                onPressed: () => Navigator.pop(context),
                child: new Text('Close'),
              )
            ],
          ),
        );
      },
    );
  }

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
            image: AssetImage("assets/images/background_header.jpg"),
          ),
        ),
      );
}
