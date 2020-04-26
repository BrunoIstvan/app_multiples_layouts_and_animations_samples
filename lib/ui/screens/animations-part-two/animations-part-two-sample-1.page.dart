import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationPart2Sample1Page extends StatefulWidget {
  @override
  _AnimationPart2Sample1PageState createState() =>
      _AnimationPart2Sample1PageState();
}

class _AnimationPart2Sample1PageState extends State<AnimationPart2Sample1Page>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  SingleChildScrollView _buildBody() {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            ScaleTransition(
              scale: CurvedAnimation(
                  curve: Interval(0.0, 1.0, curve: Curves.easeOut),
                  parent: _controller),
              child: Container(
                width: 60,
                height: 60,
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            FloatingActionButton(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget child) {
                  return Transform(
                      alignment: FractionalOffset.center,
                      transform:
                          Matrix4.rotationZ(_controller.value * .5 * math.pi),
                      child: Icon(_controller.isDismissed
                          ? Icons.play_arrow
                          : Icons.close));
                },
              ),
              onPressed: () {
                if (_controller.isDismissed)
                  _controller.forward();
                else
                  _controller.reverse();
              },
            )
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Sample 1'),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
