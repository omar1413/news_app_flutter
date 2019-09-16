import 'package:flutter/material.dart';
import 'package:news_app/src/components/header_text.dart';
import 'package:news_app/src/components/minor_text.dart';
import 'package:news_app/src/components/time_view.dart';

class NewsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(1),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _AuthorRow(margin: EdgeInsets.only(bottom: 16.0)),
          _NewsBody(),
        ],
      ),
    );
  }
}

class _NewsBody extends StatelessWidget {
  final EdgeInsetsGeometry margin;

  _NewsBody({this.margin = const EdgeInsets.all(0)});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 8.0),
            height: 124,
            width: 124,
            color: Colors.black.withOpacity(0.85),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                HeaderText('Tech Tent : Old Phones and save social'),
                SizedBox(height: 10.0),
                MinorText(
                  'we also talk about the futur of work as the robots advance, and we ask whether aretro phone ',
                  fontSize: 15.0,
                  height: 1.1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AuthorRow extends StatelessWidget {
  final EdgeInsetsGeometry margin;

  _AuthorRow({this.margin = const EdgeInsets.all(0)});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 8.0),
            width: 50,
            height: 50,
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
              SizedBox(height: 8.0),
              TimeView('15 Min'),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.bookmark_border,
                  size: 25.0,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
