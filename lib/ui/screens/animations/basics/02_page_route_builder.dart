// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class PageRouteBuilderDemo extends StatelessWidget {
  static const String routeName = '/basics/page_route_builder';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageRouteBuilderDemo'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go!'),
          onPressed: () {
            Navigator.of(context).push<void>(_createRoute());
          },
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder<SlideTransition>(
    pageBuilder: (context, animation, secondaryAnimation) => _Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var tween = Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero);
      var curveTween = CurveTween(curve: Curves.ease);

      return SlideTransition(
        position: animation.drive(curveTween).drive(tween),
        child: child,
      );
    },
  );
}

class _Page2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PageRouteBuilderDemo Page 2')),
      body: Center(
        child: Text('Page 2!', style: Theme.of(context).textTheme.display1),
      ),
    );
  }
}