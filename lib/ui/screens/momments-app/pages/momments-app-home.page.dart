import 'package:app_multiple_layouts_and_animations/ui/screens/momments-app/models/main.model.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/momments-app/pages/momments-app-form-menu.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/momments-app/utils/momments-app-buttons.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/momments-app/utils/momments-app-colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:scoped_model/scoped_model.dart';

final List<String> imgList = [
  'assets/images/pic1.jpg',
  'assets/images/pic2.jpg',
  'assets/images/pic3.jpg',
  'assets/images/pic4.jpg',
  'assets/images/pic5.jpg'
];

class MommentsAppHomePage extends StatefulWidget {
  @override
  _MommentsAppHomePageState createState() => _MommentsAppHomePageState();
}

final Widget placeholder = Container(color: Colors.grey);

List _getChildren() {
  final List<String> images = imgList;
  return map<Widget>(
    images,
    (int index, String url) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 10.0,
            color: Colors.white,
          ),
        ),
        margin: EdgeInsets.all(5.0),
        child: Image.asset(
          url,
          fit: BoxFit.cover,
          width: 261.0,
          height: 353.0,
        ),
      );
    },
  ).toList();
}

List<T> map<T>(List list, Function handler) {
  final List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class CarouselWithIndicator extends StatefulWidget {
  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> images = imgList;

    return Column(
      children: [
        CarouselSlider(
          items: _getChildren(),
          autoPlay: true,
          height: 353,
          enlargeCenterPage: true,
          onPageChanged: (index) {
            setState(() {
              _current = index;
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(
            images,
            (int index, String url) {
              return Container(
                width: 8.0,
                height: 24.0,
                margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index ? kRegistrationBlack : Colors.white,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _MommentsAppHomePageState extends State<MommentsAppHomePage> {
  @override
  Widget build(BuildContext context) {
    final MainModel _model = ScopedModel.of(context);

    void _goToHomePage() {
      Navigator.push(
        context,
        PageTransition<MommentsAppFormMenuPage>(
          type: PageTransitionType.downToUp,
          child: MommentsAppFormMenuPage(_model),
        ),
      );
    }

    Widget _buildMomentsButton(BuildContext context) {
      return Center(
        child: MomentsButton(
          text: 'MOMENTS',
          action: _goToHomePage,
        ).getButton(context),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.0), // here the desired height
        child: AppBar(
          backgroundColor: kPlatinum,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      backgroundColor: kPlatinum,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 24.0),
            child: Text('Moments', style: Theme.of(context).textTheme.caption),
          ),
          Expanded(
            child: SizedBox(
              height: 200.0,
              child: ListView(children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Column(
                    children: [
                      CarouselWithIndicator(),
                    ],
                  ),
                ),
              ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 24.0),
            child: _buildMomentsButton(context),
          ),
        ],
      ),
    );
  }
}
