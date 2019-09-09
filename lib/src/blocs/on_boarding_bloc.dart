import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/src/models/on_boarding_model.dart';
import 'package:rxdart/rxdart.dart';

class OnBoardingBloc {
  List<OnBoardingModel> onBoardingModels = [];

  final modelsStream = BehaviorSubject<List<OnBoardingModel>>();

  OnBoardingBloc() {
    addBoardingList();

    modelsStream.sink.add(onBoardingModels);
  }

  Observable<List<OnBoardingModel>> get models => modelsStream.stream;

  void addBoardingList() {
    List<String> images = [
      'assets/images/coffee1.jpg',
      'assets/images/coffee2.jpg',
      'assets/images/coffee3.jpg',
      'assets/images/coffee4.jpg',
    ];
    List<String> welcomeTxts = [
      'welcome',
      'Hello',
      'bonjour',
      'okaaaaaaaaaaaaaaay'
    ];
    List<String> describitionTxts = [
      'how are u',
      'hmmmmmmm nice image',
      'ooooooooh great pics for islands',
      'what a nice coffe',
    ];

    List<IconData> icons = [
      Icons.ac_unit,
      Icons.add,
      Icons.access_alarm,
      Icons.mail,
    ];

    for (int i = 0; i < images.length; i++) {
      onBoardingModels.add(
        OnBoardingModel(
          images[i],
          icons[i],
          welcomeTxts[i],
          describitionTxts[i],
        ),
      );
    }
  }

  void dispose() {
    modelsStream.close();
  }
}
