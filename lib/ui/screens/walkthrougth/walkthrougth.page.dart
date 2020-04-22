import 'package:flutter/material.dart';

class WalkthrougthPage extends StatefulWidget {
  final String textContent;
  WalkthrougthPage({Key key, @required this.textContent}) : super(key: key);
  @override
  _WalkthrougthPageState createState() => _WalkthrougthPageState();
}

class _WalkthrougthPageState extends State<WalkthrougthPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(child: Text(widget.textContent)),
    );
  }
}
