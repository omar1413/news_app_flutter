import 'package:flutter/material.dart';
import 'package:news_app/src/components/news_view.dart';

class Favourites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return NewsView();
      },
      itemCount: 1,
    );
  }
}
