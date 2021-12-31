import 'package:flutter/material.dart';
import 'dart:math';

import 'package:password_generator/widget_container.dart';

const MAX_LENGTH = 128128;

class ButtonGenerate extends StatefulWidget {
  final int passwordSize;
  final Difficulty difficulty;
  ButtonGenerate(this.passwordSize, this.difficulty);

  @override
  _ButtonGenerateState createState() => _ButtonGenerateState();
}

class _ButtonGenerateState extends State<ButtonGenerate> {
  final String easyChars =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
  final String mediumChars = "0123456789";
  final String hardChars = "!#\$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
  String availableChars;
  String generated = "";

  /// Event when button generate is clicked
  void click() {
    Random random = new Random();
    String created = "";
    int index;

    /// Password size limit
    if (widget.passwordSize == null || widget.passwordSize > MAX_LENGTH) return;

    /// Build available chars
    if (widget.difficulty == Difficulty.easy) {
      availableChars = easyChars;
    } else if (widget.difficulty == Difficulty.medium) {
      availableChars = easyChars + mediumChars;
    } else {
      availableChars = easyChars + mediumChars + hardChars;
    }

    for (int i = 0; i < widget.passwordSize; i++) {
      index = random.nextInt(this.availableChars.length);
      created += this.availableChars[index];
    }

    /// refresh text
    setState(() {
      this.generated = created;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      FlatButton.icon(
        icon: Icon(Icons.security),
        splashColor: Colors.green,
        onPressed: this.click,
        label: Text(
          "Generate",
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            SelectableText(this.generated,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.green))
          ],
        ),
      )
    ]);
  }
}
