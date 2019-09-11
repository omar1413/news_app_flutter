import 'package:flutter/material.dart';
import 'package:news_app/src/data/SharedPref.dart';
import 'package:news_app/src/news_app.dart';
import 'package:news_app/src/screens/home.dart';
import 'package:news_app/src/screens/on_boarding.dart';

void main() async {
  SharedPref pref = await SharedPref.getInstance();
  bool seen = pref.getSeen();

  Widget _screen = Home();
  if (seen == null || seen == false) {
    _screen = OnBoarding();
  }

  runApp(NewsApp(_screen));
}
