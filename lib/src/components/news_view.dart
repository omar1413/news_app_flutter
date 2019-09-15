import 'package:flutter/material.dart';
import 'package:news_app/src/components/minor_text.dart';
import 'package:news_app/src/components/time_view.dart';

class NewsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildAuthorRow(),
        ],
      ),
    );
  }

  Widget _buildAuthorRow() {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(8.0),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.redAccent,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            MinorText('Michal Adams'),
            TimeView('15 Min'),
          ],
        ),
      ],
    );
  }
}
