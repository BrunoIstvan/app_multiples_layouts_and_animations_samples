import 'package:app_multiple_layouts_and_animations/ui/screens/momments-app/utils/momments-app-colors.dart';
import 'package:flutter/material.dart';

class MomentsButton extends RaisedButton {
  final String text;
  final Function action;

  MomentsButton({@required this.text, @required this.action});

  ButtonTheme getButton(BuildContext context) {
    return ButtonTheme(
      minWidth: 116.0,
      height: 33.0,
      child: RaisedButton(
        color: kRegistrationBlack,
        child: Text(text, style: Theme.of(context).textTheme.button),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
        ),
        onPressed: () {
          action();
        },
      ),
    );
  }
}
