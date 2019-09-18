import 'package:flutter/material.dart';
import 'package:news_app/src/components/drawer.dart';

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
        child: Text('hello world'),
      ),
    );
  }
}
