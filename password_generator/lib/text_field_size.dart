import 'package:flutter/material.dart';

class TextFieldSize extends StatefulWidget {

  final Function(String) callback;
  TextFieldSize(this.callback);

  @override
  _TextFieldSizeState createState() => _TextFieldSizeState();
}

class _TextFieldSizeState extends State<TextFieldSize> {

  final controller = TextEditingController();

  /// Event when user click on textfield button
  void click() {
    widget.callback(this.controller.text);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: this.controller,
          decoration: InputDecoration(
            labelText: "Enter password size (max: 128)",
            prefixIcon: Icon(Icons.info),
            suffixIcon: IconButton(
              icon: Icon(Icons.check),
              splashColor: Colors.green,
              tooltip: "Apply choice",
              onPressed: this.click
            ), 
          ),
        )
      ],
    );
  }
}