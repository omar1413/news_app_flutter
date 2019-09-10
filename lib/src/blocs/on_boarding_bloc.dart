import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/src/models/on_boarding_model.dart';
import 'package:rxdart/rxdart.dart';

class OnBoardingBloc {
  List<OnBoardingModel> onBoardingModels = [];

  final _modelsStream = BehaviorSubject<List<OnBoardingModel>>();
  final _pageIndicatorStream = BehaviorSubject<Map<int, int>>();

  OnBoardingBloc() {
    addBoardingList();

    _modelsStream.sink.add(onBoardingModels);
    changeIndicator(0);
  }

  Observable<List<OnBoardingModel>> get models => _modelsStream.stream;

  Observable<Map<int, int>> get indicator => _pageIndicatorStream.stream;

  void changeIndicator(int index) {
    _pageIndicatorStream.sink.add(<int, int>{onBoardingModels.length: index});
  }

  void addBoardingList() {
    List<String> images = [
      'assets/images/coffee1.jpg',
      'assets/images/coffee2.jpg',
      'assets/images/coffee3.jpg',
      'assets/images/coffee4.jpg',
      'assets/images/coffee5.jpg',
    ];
    List<String> welcomeTxts = [
      'welcome',
      'Hello',
      'bonjour',
      'okaaaaaaaaaaaaaaay',
      'welcome every one',
    ];
    List<String> describitionTxts = [
      'how are u',
      'hmmmmmmm nice image',
      'ooooooooh great pics for islands',
      'what a nice coffe',
      'its okay for every one to know who is better to come to every one for coming here but its not to maintain here u are',
    ];

    List<IconData> icons = [
      Icons.ac_unit,
      Icons.add,
      Icons.access_alarm,
      Icons.mail,
      Icons.map,
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
    _modelsStream.close();
    _pageIndicatorStream.close();
  }
}
