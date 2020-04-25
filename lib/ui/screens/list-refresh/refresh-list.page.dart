import 'dart:async';

import 'package:flutter/material.dart';

class RefreshListPage extends StatefulWidget {
  @override
  _RefreshListPageState createState() => new _RefreshListPageState();
}

class _RefreshListPageState extends State<RefreshListPage> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.blue,
      ),
      child: new Scaffold(
        appBar: _buildAppBar(context),
        body: new RefreshIndicator(
          child: new ListView.builder(itemBuilder: _itemBuilder),
          onRefresh: _onRefresh,
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return new AppBar(
      title: new Text("Refresh List"),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer = new Completer<Null>();
    Timer(new Duration(seconds: 3), () {
      completer.complete();
    });
    return completer.future;
  }

  Widget _itemBuilder(BuildContext context, int index) {
    Todo todo = getTodo(index);
    return new TodoItemWidget(todo: todo);
  }

  Todo getTodo(int index) {
    return new Todo(false, "Todo $index");
  }
}

class TodoItemWidget extends StatefulWidget {
  TodoItemWidget({Key key, this.todo}) : super(key: key);

  final Todo todo;

  @override
  _TodoItemWidgetState createState() => new _TodoItemWidgetState();
}

class _TodoItemWidgetState extends State<TodoItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: new ListTile(
        leading: Icon(Icons.assessment),
        title: new Text(widget.todo.name),
        onTap: _onTap,
      ),
    );
  }

  void _onTap() {
    Route route = new MaterialPageRoute(
      settings: new RouteSettings(name: "/todos/todo"),
      builder: (BuildContext context) => new TodoPage(todo: widget.todo),
    );
    Navigator.of(context).push(route);
  }
}

/// place: "/todos/todo"
class TodoPage extends StatefulWidget {
  TodoPage({Key key, this.todo}) : super(key: key);

  final Todo todo;

  @override
  _TodoPageState createState() => new _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    var _children = <Widget>[
      new Text("finished: " + widget.todo.finished.toString()),
      new Text("name: " + widget.todo.name),
    ];
    return new Scaffold(
      appBar: new AppBar(title: new Text("My Todo")),
      body: new Column(
        children: _children,
      ),
    );
  }
}

class Todo {
  bool finished;
  String name;

  Todo(this.finished, this.name);
}
