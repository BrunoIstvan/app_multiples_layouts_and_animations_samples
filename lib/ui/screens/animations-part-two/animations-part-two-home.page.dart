import 'package:app_multiple_layouts_and_animations/ui/screens/animations-part-two/animations-part-two-sample-1.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/animations-part-two/animations-part-two-sample-2.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/animations-part-two/animations-part-two-sample-3.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/animations-part-two/animations-part-two-sample-4.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/animations-part-two/animations-part-two-sample-5.page.dart';
import 'package:flutter/material.dart';

class AnimationsParte2HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  Padding _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(100.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RaisedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return AnimationPart2Sample1Page();
                  },
                ),
              ),
              child: Text("1. Show Hide on Click"),
            ),
            SizedBox(
              height: 50,
            ),
            RaisedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return AnimationPart2Sample2Page();
                  },
                ),
              ),
              child: Text("2. Reveal animation"),
            ),
            SizedBox(
              height: 50,
            ),
            RaisedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return AnimationPart2Sample3Page();
                  },
                ),
              ),
              child: Text("3. Animated widget"),
            ),
            SizedBox(
              height: 50,
            ),
            RaisedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return AnimationPart2Sample4Page();
                  },
                ),
              ),
              child: Text("4. Animated builder"),
            ),
            SizedBox(
              height: 50,
            ),
            RaisedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return AnimationPart2Sample5Page();
                  },
                ),
              ),
              child: Text("5. Animated bottom bar"),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Animations Part 2'),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
