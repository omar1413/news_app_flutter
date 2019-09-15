import 'package:flutter/material.dart';

class MinorText extends StatelessWidget {
  final String text;

  MinorText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: Colors.black87, fontSize: 13.0),
    );
  }
}
