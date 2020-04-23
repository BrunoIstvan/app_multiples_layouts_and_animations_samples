import 'package:flutter/material.dart';

class CookPage extends StatefulWidget {
  final List dr;
  final img;
  final nme;

  CookPage(this.dr, this.img, this.nme);

  @override
  _CookPageState createState() => _CookPageState();
}

class _CookPageState extends State<CookPage> {
  List cb;

  initState() {
    super.initState();
    cb = List();
  }

  @override
  Widget build(BuildContext context) {
    List dr = widget.dr;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("INSTRUCTIONS"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Hero(
                  tag: widget.nme,
                  child: Image.asset(
                    'assets/' + widget.img,
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              title: Text(
                widget.nme,
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(fontFamily: 'ark', color: Colors.black),
              ),
            ),
            margin: EdgeInsets.only(top: 40, bottom: 30, left: 20),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dr.length,
              padding: EdgeInsets.all(10),
              itemBuilder: (ct, i) {
                cb.add(false);
                return ListTile(
                  title: Text(dr[i]),
                  trailing: Checkbox(
                    value: cb[i],
                    onChanged: (v) => setState(() => cb[i] = v),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
