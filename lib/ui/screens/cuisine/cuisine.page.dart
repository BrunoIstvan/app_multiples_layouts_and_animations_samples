import 'dart:convert';

import 'package:app_multiple_layouts_and_animations/ui/screens/cuisine/cook.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as http;

class CuisinePage extends StatefulWidget {
  @override
  _CuisinePageState createState() => _CuisinePageState();
}

class _CuisinePageState extends State<CuisinePage> {
  List fd;
  Map fi;

  void initState() {
    super.initState();
    _getData();
  }

  _getData() async {
    http.Response r =
        await http.get('https://filipino-cuisine-app.firebaseio.com/data.json');
    fd = json.decode(r.body);
    setState(() => fi = fd[0]);
  }

  Widget build(ct) {
    if (fd == null)
      return Container(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );

    var t = Theme.of(ct).textTheme;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Swiper(
              onIndexChanged: (n) => setState(() => fi = fd[n]),
              itemCount: fd.length,
              itemBuilder: (cx, i) {
                return Container(
                  margin: EdgeInsets.only(top: 40, bottom: 24),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Hero(
                      tag: fd[i]['fn'],
                      child: Image.asset(
                        'assets/' + fd[i]['pf'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
              viewportFraction: .85,
              scale: .9,
            ),
          ),
          Text(
            fi['fn'],
            style: t.headline2.copyWith(fontFamily: 'ark', color: Colors.black),
          ),
          Container(
            child: Text(
              fi['cn'],
              style: t.subtitle1.apply(color: Colors.red, fontFamily: 'opb'),
            ),
            margin: EdgeInsets.only(top: 10, bottom: 30),
          ),
          Container(
            child: Text(
              fi['dc'],
              textAlign: TextAlign.center,
              style: t.subtitle1.copyWith(fontFamily: 'opr'),
            ),
            margin: EdgeInsets.only(left: 10, right: 10),
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: fi['ig'].length,
              itemBuilder: (cx, i) {
                return Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 60,
                      child: Image.asset(
                        'assets/' + fi['ig'][i]['p'],
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            fi['ig'][i]['n'],
                            style: t.subtitle2.copyWith(fontFamily: 'opb'),
                          ),
                          Text(
                            fi['ig'][i]['c'],
                            style: t.caption.copyWith(fontFamily: 'opr'),
                          )
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restaurant_menu),
        onPressed: () => Navigator.push(
          ct,
          MaterialPageRoute(
            builder: (cx) => CookPage(
              fi['in'],
              fi['pf'],
              fi['fn'],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(fi['fv'] ? Icons.favorite : Icons.favorite_border),
              onPressed: () => setState(() => fi['fv'] = !fi['fv']),
            ),
            IconButton(icon: Icon(Icons.share), onPressed: () {})
          ],
        ),
      ),
    );
  }
}
