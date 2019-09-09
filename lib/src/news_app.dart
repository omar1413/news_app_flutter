import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/src/blocs/on_boarding_bloc_provider.dart';
import 'package:news_app/src/screens/on_boarding.dart';

class NewsApp extends StatelessWidget {
  final style = TextStyle(color: Colors.red);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark));
    return OnBoardingBlocProvider(
      child: MaterialApp(
        theme: ThemeData.light(),
        home: OnBoarding(),
      ),
    );
  }
}
