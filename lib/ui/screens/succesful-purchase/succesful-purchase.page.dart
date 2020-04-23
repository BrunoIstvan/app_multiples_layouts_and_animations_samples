import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuccesfulPurchasePage extends StatefulWidget {
  @override
  _SuccesfulPurchasePageState createState() => _SuccesfulPurchasePageState();
}

class _SuccesfulPurchasePageState extends State<SuccesfulPurchasePage> {
  @override
  Widget build(BuildContext context) {
    //
    Size size = MediaQuery.of(context).size;
    //
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Succesful Purchase'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 70),
            _buildBulbImage(size),
            _buildResponseText,
            _buildTokenField,
            _buildPurchaseText,
            _buildCopyTokenButton(),
            SizedBox(height: 10),
            _buildGoHomeButton(),
            _buildViewTransactionDetailsBox(context),
          ],
        ),
      ),
    );
  }

  Expanded _buildViewTransactionDetailsBox(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: _viewMoreButtons(
          "View Transaction Details",
          () => _showPowerBottomSheet(context),
        ),
      ),
    );
  }

  Padding _buildGoHomeButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
      child: SizedBox(
        width: double.infinity,
        child: _blueButton(
          "Go Home",
          () => {},
        ),
      ),
    );
  }

  Padding _buildCopyTokenButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
      child: SizedBox(
        width: double.infinity,
        child: _blueButton(
          "Copy Token",
          () {
            Clipboard.setData(
              ClipboardData(text: "4671-0884-7276-4345-8709"),
            );
            Flushbar(
              title: "Ok",
              message: "Token copied successfully",
              duration: Duration(seconds: 3),
            )..show(context);
          },
        ),
      ),
    );
  }

  Widget _buildPurchaseText = Center(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(85, 20, 85, 20),
      child: Text(
          "You have successfully purchased 77.25 worth of power units for 12,000 Naira",
          style: TextStyle(color: Color(0xff063057), fontSize: 14),
          textAlign: TextAlign.center),
    ),
  );

  Widget _buildTokenField = Center(
    child: Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Container(
            margin: const EdgeInsets.all(7.0),
            padding: const EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffFFAC38),
                width: 3,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: SelectableText(
              "4671-0884-7276-4345-8709",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.white),
            child: Text(' Token '),
          ),
        ),
      ],
    ),
  );

  Widget _buildResponseText = Center(
    child: Padding(
      padding: const EdgeInsets.all(25.0),
      child: Text(
        "Success!",
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );

  Widget _buildBulbImage(Size size) => Center(
        child: Image.asset(
          'assets/success-bulb.png',
          width: size.width * .30,
          fit: BoxFit.fill,
        ),
      );

  Widget _blueButton(String label, Function fun) => RaisedButton(
        onPressed: fun,
        textColor: Colors.white,
        color: Color(0xfff063057),
        padding: const EdgeInsets.all(15.0),
        child: Text(label),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      );

  MaterialButton _viewMoreButtons(String title, Function fun) => MaterialButton(
        onPressed: fun,
        textColor: Colors.white,
        color: const Color(0xffFFAC38),
        child: SizedBox(
          width: double.infinity,
          child: Text(
            title,
            textAlign: TextAlign.left,
          ),
        ),
        height: 55,
        minWidth: 700,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      );

  _showPowerBottomSheet(BuildContext context) => showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          height: 600,
          color: Color(0xFF737373),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                )),
            child: Column(
              children: <Widget>[
                _viewMoreButtons(
                    "Close Transaction", () => {Navigator.pop(context)}),
                SizedBox(height: 10),
                _listItemContainer("Date of Transaction", "17th April, 2019"),
                _listItemContainer("Transaction References", "KED12435353636"),
                _listItemContainer("Token", "1234 5668 4657 3849"),
                _listItemContainer("Account Type", "Prepaid"),
              ],
            ),
          ),
        );
      });

  Widget _listItemContainer(String title, String value) => Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        padding: EdgeInsets.symmetric(vertical: 10.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(196, 196, 196, 1)),
            ),
            SizedBox(height: 6),
            Text(
              value,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
          ],
        ),
        decoration: BoxDecoration(
            border: new Border(
                bottom: new BorderSide(width: 1.0, color: Color(0xffC4C4C4)))),
      );
}
