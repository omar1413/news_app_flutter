import 'package:flutter/material.dart';
import 'package:news_app/src/screens/on_boarding.dart';

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: OnBoarding(),
    );
  }
}
