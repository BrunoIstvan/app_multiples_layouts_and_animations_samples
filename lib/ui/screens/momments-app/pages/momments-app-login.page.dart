import 'package:app_multiple_layouts_and_animations/ui/screens/momments-app/models/main.model.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/momments-app/pages/momments-app-home.page.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/momments-app/utils/momments-app-buttons.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/momments-app/utils/momments-app-colors.dart';
import 'package:app_multiple_layouts_and_animations/ui/screens/momments-app/utils/momments-app-constants.dart';
import 'package:flutter/material.dart';

class MommentsAppLoginPage extends StatefulWidget {
  final MainModel model;
  MommentsAppLoginPage(this.model);

  @override
  _MommentsAppLoginPageState createState() => _MommentsAppLoginPageState();
}

class AccentColorOverride extends StatelessWidget {
  AccentColorOverride({Key key, this.color, this.child}) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(
        accentColor: color,
        brightness: Brightness.dark,
      ),
    );
  }
}

// desenvolver https://github.com/lawreyios/FlutterMoments.git

class _MommentsAppLoginPageState extends State<MommentsAppLoginPage> {
  //
  final _mobileNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _mobileNumber;

  Widget _buildLoginTextField() {
    return Theme(
      data: ThemeData(
        primaryColor: kRegistrationBlack,
        primaryColorDark: kRegistrationBlack,
      ),
      child: TextFormField(
        style: Theme.of(context).textTheme.subtitle2,
        controller: _mobileNumberController,
        maxLength: 4,
        enableInteractiveSelection: false,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (value) {
          loginUser();
        },
        decoration: InputDecoration(
          fillColor: kRegistrationBlack,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          labelText: LOGIN_LABEL_TEXT,
          suffixIcon: IconButton(
            icon: Icon(
              Icons.clear,
              color: kRegistrationBlack,
            ),
            onPressed: () {
              _mobileNumberController.clear();
              _mobileNumber = '';
            },
          ),
        ),
        validator: (String value) {
          if (value.isEmpty || value.length != 4) {
            return 'Please enter a valid 4 digit code.';
          }
          return null;
        },
        onSaved: (String value) {
          _mobileNumber = value;
        },
      ),
    );
  }

  Widget _buildEnterButton(BuildContext context) {
    return Center(
      child: MomentsButton(
        text: ENTER,
        action: loginUser,
      ).getButton(context),
    );
  }

  void loginUser() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();

    final bool success = widget.model.loginUser(_mobileNumber);

    if (success) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) {
            return MommentsAppHomePage();
          },
        ),
      );

      _mobileNumberController.clear();
      _mobileNumber = '';
    } else {
      showDialog<dynamic>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Invalid Code!'),
            content: Text('Please re-enter code again.'),
            actions: <Widget>[
              FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _mobileNumberController.clear();
                  _mobileNumber = '';
                },
              )
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/LOGO.png',
                  height: 150.0,
                ),
                SizedBox(height: 12.0),
                Text('Moments', style: Theme.of(context).textTheme.caption),
              ],
            ),
            SizedBox(height: 50.0),
            Text('Login:', style: Theme.of(context).textTheme.subtitle2),
            SizedBox(height: 10.0),
            AccentColorOverride(
              color: kRegistrationBlack,
              child: Form(
                key: _formKey,
                child: _buildLoginTextField(),
              ),
            ),
            _buildEnterButton(context)
          ],
        ),
      ),
    );
  }
}
