import 'package:flutter/material.dart';
import 'widget_container.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Password generator")),
        body: Container(
            margin: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[WidgetContainer()],
            )));
  }
}
