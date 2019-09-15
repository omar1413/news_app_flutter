import 'package:flutter/material.dart';

class TimeView extends StatelessWidget {
  final String text;

  TimeView(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.timer,
          color: Colors.black54,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.black87),
        )
      ],
    );
  }
}
