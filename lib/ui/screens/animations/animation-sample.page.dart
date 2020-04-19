import 'package:app_multiple_layouts_and_animations/ui/screens/animations/basics/01_animated_container.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/animations/basics/02_page_route_builder.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/animations/basics/03_animation_controller.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/animations/basics/04_tweens.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/animations/basics/05_animated_builder.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/animations/basics/06_custom_tween.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/animations/basics/07_tween_sequence.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/animations/basics/08_fade_transition.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/animations/basics/09_animated_positioned.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/animations/basics/10_animated_switcher.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/animations/misc/animated_list.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/animations/misc/card_swipe.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/animations/misc/carousel.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/animations/misc/expand_card.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/animations/misc/focus_image.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/animations/misc/hero_animation.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/animations/misc/physics_card_drag.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/animations/misc/repeating_animation.dart';
import 'package:flutter/material.dart';

class AnimationSamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final headerStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Samples'),
      ),
      body: ListView(
        children: [
          ListTile(title: Text('Basics', style: headerStyle)),
          ...basicDemos.map((d) => DemoTile(d)),
          ListTile(title: Text('Misc', style: headerStyle)),
          ...miscDemos.map((d) => DemoTile(d)),
        ],
      ),
    );
  }
}

class Demo {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const Demo({this.name, this.route, this.builder});
}

final basicDemos = [
  Demo(
      name: 'AnimatedContainer',
      route: AnimatedContainerDemo.routeName,
      builder: (context) => AnimatedContainerDemo()),
  Demo(
      name: 'PageRouteBuilder',
      route: PageRouteBuilderDemo.routeName,
      builder: (context) => PageRouteBuilderDemo()),
  Demo(
      name: 'Animation Controller',
      route: AnimationControllerDemo.routeName,
      builder: (context) => AnimationControllerDemo()),
  Demo(
      name: 'Tweens',
      route: TweenDemo.routeName,
      builder: (context) => TweenDemo()),
  Demo(
      name: 'AnimatedBuilder',
      route: AnimatedBuilderDemo.routeName,
      builder: (context) => AnimatedBuilderDemo()),
  Demo(
      name: 'Custom Tween',
      route: CustomTweenDemo.routeName,
      builder: (context) => CustomTweenDemo()),
  Demo(
      name: 'Tween Sequences',
      route: TweenSequenceDemo.routeName,
      builder: (context) => TweenSequenceDemo()),
  Demo(
      name: 'Fade Transition',
      route: FadeTransitionDemo.routeName,
      builder: (context) => FadeTransitionDemo()),
  Demo(
      name: 'AnimatedPositioned',
      route: AnimatedPositionedDemo.routeName,
      builder: (context) => AnimatedPositionedDemo()),
  Demo(
      name: 'AnimatedSwitcher',
      route: AnimatedSwitcherDemo.routeName,
      builder: (context) => AnimatedSwitcherDemo())
];

final miscDemos = [
  Demo(
      name: 'Expandable Card',
      route: ExpandCardDemo.routeName,
      builder: (context) => ExpandCardDemo()),
  Demo(
      name: 'Carousel',
      route: CarouselDemo.routeName,
      builder: (context) => CarouselDemo()),
  Demo(
      name: 'Focus Image',
      route: FocusImageDemo.routeName,
      builder: (context) => FocusImageDemo()),
  Demo(
      name: 'Card Swipe',
      route: CardSwipeDemo.routeName,
      builder: (context) => CardSwipeDemo()),
  Demo(
      name: 'Repeating Animation',
      route: RepeatingAnimationDemo.routeName,
      builder: (context) => RepeatingAnimationDemo()),
  Demo(
      name: 'Spring Physics',
      route: PhysicsCardDragDemo.routeName,
      builder: (context) => PhysicsCardDragDemo()),
  Demo(
      name: 'AnimatedList',
      route: AnimatedListDemo.routeName,
      builder: (context) => AnimatedListDemo()),
  Demo(
      name: 'Hero Animation',
      route: HeroAnimationDemo.routeName,
      builder: (context) => HeroAnimationDemo()),
];

final basicDemoRoutes =
    Map.fromEntries(basicDemos.map((d) => MapEntry(d.route, d.builder)));

final miscDemoRoutes =
    Map.fromEntries(miscDemos.map((d) => MapEntry(d.route, d.builder)));

final allRoutes = <String, WidgetBuilder>{
  ...basicDemoRoutes,
  ...miscDemoRoutes,
};

class DemoTile extends StatelessWidget {
  final Demo demo;

  DemoTile(this.demo);

  Widget build(BuildContext context) {
    return ListTile(
      title: Text(demo.name),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: demo.builder));
      },
    );
  }
}
