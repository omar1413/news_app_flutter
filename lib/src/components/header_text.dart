import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;

  HeaderText(this.text, {this.textAlign = TextAlign.left});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black87,
        fontSize: 18.0,
        fontWeight: FontWeight.w700,
      ),
      textAlign: textAlign,
    );
  }
}

class NormalText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  NormalText(this.text, {this.fontSize = 18.0, this.color = Colors.black87});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
