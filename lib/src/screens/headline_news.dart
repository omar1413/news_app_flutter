import 'package:flutter/material.dart';
import 'package:news_app/src/components/drawer.dart';
import 'package:news_app/src/components/home_tabs/favourites.dart';
import 'package:news_app/src/components/home_tabs/popular.dart';

class HeadlineNews extends StatefulWidget {
  @override
  _HeadlineNewsState createState() => _HeadlineNewsState();
}

class _HeadlineNewsState extends State<HeadlineNews>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HeadLine News'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(text: "News"),
            Tab(text: 'POPULAR'),
            Tab(text: 'FAVOURITES')
          ],
          controller: _tabController,
        ),
      ),
      drawer: MyDrawer(),
      body: TabBarView(
        children: <Widget>[
          Favourites(),
          Popular(),
          Favourites(),
        ],
        controller: _tabController,
      ),
    );
  }
}
