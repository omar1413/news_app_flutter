import 'package:flutter/material.dart';

class MinorText extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign textAlign;
  final double height;

  MinorText(this.text,
      {this.height, this.fontSize = 13.0, this.textAlign = TextAlign.left});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.black87,
          fontSize: fontSize,
          wordSpacing: 5.0,
          height: height),
      textAlign: textAlign,
    );
  }
}
