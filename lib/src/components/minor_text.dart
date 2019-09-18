import 'package:flutter/material.dart';

class MinorText extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign textAlign;
  final double height;
  final Color color;

  MinorText(this.text,
      {this.color = Colors.black87,
      this.height,
      this.fontSize = 13.0,
      this.textAlign = TextAlign.left});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color, fontSize: fontSize, wordSpacing: 5.0, height: height),
      textAlign: textAlign,
    );
  }
}
