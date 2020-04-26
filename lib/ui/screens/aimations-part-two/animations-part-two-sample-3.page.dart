import 'package:flutter/material.dart';

class AnimationPart2Sample3Page extends StatefulWidget {
  @override
  _AnimationPart2Sample3PageState createState() =>
      _AnimationPart2Sample3PageState();
}

class _AnimationPart2Sample3PageState extends State<AnimationPart2Sample3Page>
    with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
    super.initState();
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

  Center _buildBody() {
    return Center(
      child: AnimatedLogo(
        animation: animation,
        child: FlutterLogo(),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Sample 3'),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}

class AnimatedLogo extends AnimatedWidget {
  final Widget child;
  AnimatedLogo({Key key, Animation<double> animation, this.child})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: child,
      ),
    );
  }
}
