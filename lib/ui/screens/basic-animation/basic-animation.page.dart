import 'package:flutter/material.dart';

class BasicAnimationPage extends StatefulWidget {
  @override
  _BasicAnimationPageState createState() => _BasicAnimationPageState();
}

class _BasicAnimationPageState extends State<BasicAnimationPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    //vsync make sure that no unecessary resource are used by our device
    controller = new AnimationController(
        duration: new Duration(microseconds: 800), vsync: this);
    //curve is used to define how our animation behaves
    animation =
        new CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    animation.addListener(() {
      //we call setState everytime when the animation value changes
      this.setState(() {});
    });
    animation.addStatusListener((AnimationStatus status) {});
    /*to start the animation we use this but it shows animation
    only once i.e you have to restart app again n again*/

    // controller.forward();

    //use controller.repeat() to repeat your animation
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  Column _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Container(
          color: Colors.white,
          height: 3.0,
          width: animation.value * 100.0, //animation.value ranges from 0 to 1
        ),
        new Padding(padding: new EdgeInsets.only(bottom: 5.0)),
        new Container(
          color: Colors.white,
          height: 3.0,
          width: animation.value * 75.0, //animation.value ranges from 0 to 1
        ),
        new Padding(padding: new EdgeInsets.only(bottom: 5.0)),
        new Container(
          color: Colors.white,
          height: 3.0,
          width: animation.value * 50.0, //animation.value ranges from 0 to 1
        ),
      ],
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Basic Animation'),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
