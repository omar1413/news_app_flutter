import 'package:flutter/material.dart';
import 'package:news_app/src/components/drawer.dart';
import 'package:news_app/src/components/header_text.dart';
import 'package:news_app/src/components/minor_text.dart';

class TwitterFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Twitter Feed'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      drawer: MyDrawer(),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return _FeedCard();
          },
          itemCount: 20,
        ),
      ),
    );
  }
}

class _FeedCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 50,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            buildCardHeader(),
            SizedBox(height: 16.0),
            buildCardBody(),
            SizedBox(height: 16.0),
            Container(color: Colors.grey, width: double.infinity, height: 1.0),
            SizedBox(height: 8.0),
            buildCardFooter(),
          ],
        ),
      ),
    );
  }

  Widget buildCardHeader() {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 16.0),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.redAccent,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                HeaderText('Christina Meyers'),
                SizedBox(width: 5.0),
                MinorText('@ch_meyers'),
              ],
            ),
            MinorText('Fri, 12 May 2017 . 14.30')
          ],
        ),
      ],
    );
  }

  Widget buildCardBody() {
    return NormalText(
        'we also talk about the future of work as the robots advance, and we ask rather a retro phone');
  }

  Widget buildCardFooter() {
    double iconSize = 30.0;
    double fontSize = 15.0;
    double buttonFontSize = 15.0;

    final btnColor = Colors.white.withAlpha(0);
    final btnHighlightColor = Colors.redAccent;
    final btnSplashColor = Colors.orangeAccent;

    const color = Colors.orangeAccent;
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: IconButton(
            onPressed: (){},
            color: btnColor,
            highlightColor: btnHighlightColor,
            splashColor: btnSplashColor,
            padding: EdgeInsets.all(0),
            icon: Icon(
              Icons.repeat,
              color: color.withOpacity(1),
              size: iconSize,
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: MinorText(
              '24',
              fontSize: fontSize,
              color: Colors.grey,
            )),
        Expanded(flex: 4, child: SizedBox(width: 1)),
        Expanded(
          flex: 2,
          child: MaterialButton(
            elevation: 0,
            padding: EdgeInsets.all(0),
            onPressed: () {},
            color: btnColor,
            highlightColor: btnHighlightColor,
            splashColor: btnSplashColor,
            child: NormalText(
              'SHARE',
              color: color,
              fontSize: buttonFontSize,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: MaterialButton(
            elevation: 0,
            padding: EdgeInsets.all(0),
            onPressed: () {},
            color: btnColor,
            highlightColor: btnHighlightColor,
            splashColor: btnSplashColor,
            child: NormalText(
              'OPEN',
              color: color,
              fontSize: buttonFontSize,
            ),
          ),
        )
      ],
    );
  }
}
