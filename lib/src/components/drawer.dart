import 'package:flutter/material.dart';
import 'package:news_app/src/screens/headline_news.dart';
import 'package:news_app/src/screens/home.dart';
import 'package:news_app/src/screens/instagram_feed.dart';
import 'package:news_app/src/screens/twitter_feed.dart';

class MyDrawer extends StatelessWidget {
  final List<_NavModel> navMenu = [
    _NavModel('Explorer', () => Home()),
    _NavModel('Headline News', () => HeadlineNews()),
    _NavModel('Twitter Feed', () => TwitterFeed()),
    _NavModel('Instagram Feed', () => InstagramFeed()),
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.70,
        child: Drawer(
          child: Padding(
            padding: const EdgeInsets.only(top: 52.0),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return navMenu[index].screen();
                        },
                      ),
                    );
                  },
                  title: Center(
                    child: Text(
                      navMenu[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  trailing: Icon(Icons.chevron_right),
                );
              },
              itemCount: navMenu.length,
            ),
          ),
        ),
      ),
    );
  }
}

class _NavModel {
  final String title;
  final Function screen;

  _NavModel(this.title, this.screen);
}
