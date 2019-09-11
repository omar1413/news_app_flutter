import 'package:flutter/material.dart';
import 'package:news_app/src/blocs/on_boarding_bloc_provider.dart';
import 'package:news_app/src/utils/apptheme.dart';

class NewsApp extends StatelessWidget {
  final style = TextStyle(color: Colors.red);

  final Widget _screen;

  NewsApp(this._screen);

  @override
  Widget build(BuildContext context) {
    return OnBoardingBlocProvider(
      child: MaterialApp(
        theme: AppTheme.appTheme,
        home: _screen,
      ),
    );
  }
}
