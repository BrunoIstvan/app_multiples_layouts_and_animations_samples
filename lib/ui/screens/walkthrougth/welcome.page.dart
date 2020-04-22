import 'package:app_multiple_layouts_and_animations/ui/screens/walkthrougth/walkthrougth.page.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int currentIndexPage;
  int pageLength;

  @override
  void initState() {
    currentIndexPage = 0;
    pageLength = 4;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) => Stack(
        children: <Widget>[
          PageView(
            children: <Widget>[
              WalkthrougthPage(textContent: "Walkthrough one"),
              WalkthrougthPage(textContent: "Walkthrough two"),
              WalkthrougthPage(textContent: "Walkthrough tree"),
              WalkthrougthPage(textContent: "Walkthrough four"),
            ],
            onPageChanged: (value) {
              setState(() => currentIndexPage = value);
            },
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.8,
            // left: MediaQuery.of(context).size.width * 0.35,
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.4),
              child: Align(
                alignment: Alignment.center,
                child: new DotsIndicator(
                  dotsCount: pageLength,
                  position: currentIndexPage,
                  decorator: DotsDecorator(
                    color: Colors.black87,
                    activeColor: Colors.amber,
                  ),
                ),
              ),
            ),
          )
        ],
      );

  Widget _buildAppBar(BuildContext context) => AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Walkthrougth'),
      );
}
