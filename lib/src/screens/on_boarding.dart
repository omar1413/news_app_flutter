import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black38,
        child: Stack(
          children: <Widget>[
            PageView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.ac_unit,
                      color: Colors.white,
                      size: 100.0,
                    ),
                    Text('welcome'),
                    Text('Hello Again'),
                  ],
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                color: Colors.red,
                child: Container(
                  child: Text('Get Started'),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
