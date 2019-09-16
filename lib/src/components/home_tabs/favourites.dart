import 'package:flutter/material.dart';
import 'package:news_app/src/components/news_view.dart';

class Favourites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            NewsView(),
            SizedBox(
              width: double.infinity,
              height: 1.0,
            )
          ],
        );
      },
      itemCount: 20,
    );
  }
}
