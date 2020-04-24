import 'package:app_multiple_layouts_and_animations/ui/screens/contactly-app/contactly-app-constants.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/contactly-app/contactly-home.page.dart';
import 'package:flutter/material.dart';

class ContactlyLoginPage extends StatelessWidget {
  // 2
  final _pinCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor: appDarkGreyColor,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            _buildLogo(),
            SizedBox(height: bigRadius),
            _buildPinCode(),
            SizedBox(height: buttonHeight),
            _buildLoginButton(context),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) => AppBar(
        backgroundColor: appDarkGreyColor,
        title: Text('Login'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      );

  // 3a
  CircleAvatar _buildLogo() => CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: bigRadius,
        child: appLogo,
      );

  // 3b
  Widget _buildPinCode() => TextFormField(
        controller: _pinCodeController,
        keyboardType: TextInputType.phone,
        maxLength: 4,
        maxLines: 1,
        autofocus: true,
        decoration: InputDecoration(
          hintText: pinCodeHintText,
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          hintStyle: TextStyle(color: Colors.white),
        ),
        style: TextStyle(
          color: Colors.white,
        ),
      );

  // 3c
  Padding _buildLoginButton(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) {
                  return ContactlyHomePage();
                },
              ),
            );
          },
          padding: EdgeInsets.all(12),
          color: appGreyColor,
          child: Text(
            loginButtonText,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
}
