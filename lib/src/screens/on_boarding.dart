import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/src/blocs/on_boarding_bloc.dart';
import 'package:news_app/src/blocs/on_boarding_bloc_provider.dart';
import 'package:news_app/src/models/on_boarding_model.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    final bloc = OnBoardingBlocProvider.of(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          buildPageView(bloc),
          buildButton(),
        ],
      ),
    );
  }

  Widget buildButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 8.0, left: 16.0, right: 16.0),
        child: SizedBox(
          width: double.infinity,
          child: RaisedButton(
            color: Colors.red,
            child: Container(
              child: Text('Get Started'),
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  Widget buildPageView(OnBoardingBloc bloc) {
    return StreamBuilder<List<OnBoardingModel>>(
      stream: bloc.modelsStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return PageView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return pageItem(snapshot.data[index]);
              });
        }
        return Text('no data');
      },
    );
  }

  Widget buildOnBoardingImage(String imageUri) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage(
            imageUri,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildOnBoardingIcon(IconData icon) {
    return Transform.translate(
      offset: Offset(0, -80),
      child: Icon(
        icon,
        color: Colors.white,
        size: 100.0,
      ),
    );
  }

  Widget buildTitle(String msg) {
    return Text(
      msg,
      style: TextStyle(
        fontSize: 38.0,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget buildDescriptionText(String desc) {
    return Text(
      desc,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18.0,
      ),
    );
  }

  Widget pageItem(OnBoardingModel data) {
    return Stack(
      children: <Widget>[
        buildOnBoardingImage(data.imageUri),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildOnBoardingIcon(data.icon),
            buildTitle(data.title),
            SizedBox(height: 10.0),
            buildDescriptionText(data.description)
          ],
        ),
      ],
    );
  }
}
