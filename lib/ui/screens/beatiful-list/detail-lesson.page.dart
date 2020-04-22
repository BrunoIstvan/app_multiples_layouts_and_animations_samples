import 'package:app_multiple_layouts_and_animations/ui/screens/beatiful-list/lesson.model.dart';
import 'package:flutter/material.dart';

class DetailLessonPage extends StatefulWidget {
  final LessonModel lesson;

  DetailLessonPage({Key key, this.lesson}) : super(key: key);

  @override
  _DetailLessonPageState createState() => _DetailLessonPageState();
}

class _DetailLessonPageState extends State<DetailLessonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _buildTopContent(context),
          _buildBottomContent(context),
        ],
      ),
    );
  }

  Widget _buildBottomContentText() => Text(
        widget.lesson.content,
        style: TextStyle(fontSize: 18.0),
      );

  Widget _buildReadButton() => Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: RaisedButton(
          onPressed: () => {},
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child:
              Text("TAKE THIS LESSON", style: TextStyle(color: Colors.white)),
        ),
      );

  Widget _buildBottomContent(BuildContext context) => Container(
        // height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // color: Theme.of(context).primaryColor,
        padding: EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            children: <Widget>[_buildBottomContentText(), _buildReadButton()],
          ),
        ),
      );

  Widget _buildLevelIndicator() => Container(
        child: Container(
          child: LinearProgressIndicator(
            backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
            value: widget.lesson.indicatorValue,
            valueColor: AlwaysStoppedAnimation(Colors.green),
          ),
        ),
      );

  Widget _buildCoursePrice() => Container(
        padding: const EdgeInsets.all(7.0),
        decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: new Text(
          // "\$20",
          "\$" + widget.lesson.price.toString(),
          style: TextStyle(color: Colors.white),
        ),
      );

  Widget _buildTopContentText() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 120.0),
          Icon(
            Icons.directions_car,
            color: Colors.white,
            size: 40.0,
          ),
          Container(
            width: 90.0,
            child: new Divider(color: Colors.green),
          ),
          SizedBox(height: 10.0),
          Text(
            widget.lesson.title,
            style: TextStyle(color: Colors.white, fontSize: 45.0),
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(flex: 1, child: _buildLevelIndicator()),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    widget.lesson.level,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Expanded(flex: 1, child: _buildCoursePrice())
            ],
          ),
        ],
      );

  Widget _buildTopContent(BuildContext context) => Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("drive-steering-wheel.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            padding: EdgeInsets.fromLTRB(40.0, 40, 40, 40),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
            child: Center(
              child: _buildTopContentText(),
            ),
          ),
          Positioned(
            left: 8.0,
            top: 60.0,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, color: Colors.white),
            ),
          )
        ],
      );
}
