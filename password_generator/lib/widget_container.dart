import 'package:flutter/material.dart';
import 'button_generate.dart';
import 'text_field_size.dart';

enum Difficulty { easy, medium, hard }

class WidgetContainer extends StatefulWidget {
  @override
  _WidgetContainerState createState() => _WidgetContainerState();
}

class _WidgetContainerState extends State<WidgetContainer> {
  Difficulty _difficulty = Difficulty.easy;
  int passwordSize;

  /// Parse and init password size attribute
  void getSize(String size) {
    if (size != null) {
      setState(() {
        this.passwordSize = int.parse(size);
      });
    }
  }

  /// When radio button change
  void onRadioChange(Difficulty value) {
    setState(() {
      _difficulty = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
          margin: const EdgeInsets.only(top: 30.0, bottom: 10.0),
          child: const Text(
            "Password difficulty",
            style: TextStyle(fontSize: 20.0, color: Colors.green),
          )),
      ListTile(
        title: const Text('Easy'),
        leading: Radio(
            value: Difficulty.easy,
            groupValue: _difficulty,
            onChanged: this.onRadioChange),
      ),
      ListTile(
        title: const Text('Medium'),
        leading: Radio(
          value: Difficulty.medium,
          groupValue: _difficulty,
          onChanged: this.onRadioChange,
        ),
      ),
      ListTile(
        title: const Text('Hard'),
        leading: Radio(
          value: Difficulty.hard,
          groupValue: _difficulty,
          onChanged: this.onRadioChange,
        ),
      ),
      TextFieldSize(this.getSize),
      ButtonGenerate(this.passwordSize, this._difficulty)
    ]);
  }
}
