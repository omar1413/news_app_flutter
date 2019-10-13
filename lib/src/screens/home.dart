import 'package:flutter/material.dart';
import 'package:news_app/src/components/drawer.dart';
import 'package:news_app/src/components/header_text.dart';
import 'package:news_app/src/components/home_tabs/favourites.dart';
import 'package:news_app/src/components/home_tabs/popular.dart';
import 'package:news_app/src/components/home_tabs/whats_new.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
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
        title: Text('Explore'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          _buildPopupMenu(),
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(text: "WHAT'S NEW"),
            Tab(text: 'POPULAR'),
            Tab(text: 'FAVOURITES')
          ],
          controller: _tabController,
        ),
      ),
      drawer: MyDrawer(),
      body: TabBarView(
        children: <Widget>[
          WhatsNew(),
          Popular(),
          Favourites(),
        ],
        controller: _tabController,
      ),
    );
  }

  Widget _buildPopupMenu() {
    return PopupMenuButton(
      color: Colors.white,
      icon: Icon(Icons.more_vert),
      itemBuilder: (context){
      return [PopupMenuItem(value: _PopupMenu.CONTACT,
      child: NormalText('Contact'),),
        PopupMenuItem(value: _PopupMenu.HELP,
            child: NormalText('Help'),),
        PopupMenuItem(value: _PopupMenu.SETTINGS,
            child: NormalText('Settings'),),];
    },);
  }
}

enum _PopupMenu{
  CONTACT,
  HELP,
  SETTINGS,
}
