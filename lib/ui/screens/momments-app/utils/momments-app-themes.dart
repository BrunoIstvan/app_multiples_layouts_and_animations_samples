import 'package:app_multiple_layouts_and_animations/ui/screens/momments-app/utils/momments-app-colors.dart';
import 'package:flutter/material.dart';

class MomentsTheme {
  ThemeData _themeData;

  MomentsTheme() {
    this._themeData = _buildMomentsTheme();
  }

  ThemeData get data {
    return _themeData;
  }

  ThemeData _buildMomentsTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
        accentColor: kRegistrationBlack,
        primaryColor: kRegistrationBlack,
        scaffoldBackgroundColor: kMomentsWhite,
        cardColor: kMomentsWhite,
        errorColor: kMomentsErrorRed,
        textTheme: _buildMomentsTextTheme(base.textTheme),
        primaryTextTheme: _buildMomentsTextTheme(base.primaryTextTheme),
        accentTextTheme: _buildMomentsTextTheme(base.accentTextTheme),
        primaryIconTheme: base.iconTheme.copyWith(color: kRegistrationBlack),
        unselectedWidgetColor: kRegistrationBlack);
  }

  TextTheme _buildMomentsTextTheme(TextTheme base) {
    return base.copyWith(
      headline5: base.headline5.copyWith(
        fontFamily: 'Cookie',
        fontSize: 36.0,
        color: kRegistrationBlack,
      ),
      headline6: base.headline6.copyWith(
        fontSize: 18.0,
        fontFamily: 'DINOT',
        color: kRegistrationBlack,
      ),
      subtitle2: base.headline6.copyWith(
        fontSize: 14.0,
        fontFamily: 'DINOT',
        color: kRegistrationBlack,
      ),
      caption: base.caption.copyWith(
        fontFamily: 'DancingScript',
        fontSize: 50.0,
        color: kRegistrationBlack,
      ),
      headline4: base.headline4.copyWith(
        fontFamily: 'DancingScript',
        fontSize: 14.0,
        color: kRegistrationBlack,
      ),
      button: base.button.copyWith(
        fontFamily: 'DancingScript',
        fontSize: 14.0,
        color: kMomentsWhite,
      ),
    );
  }
}
