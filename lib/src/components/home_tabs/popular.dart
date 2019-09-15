import 'package:flutter/material.dart';
import 'package:news_app/src/components/news_card.dart';

class Popular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(0),
              child: NewsCard(),
            ),
            Divider(height: 1),
          ],
        );
      },
      itemCount: 20,
    );
  }
}
