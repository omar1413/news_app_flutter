import 'package:flutter/material.dart';
import 'package:news_app/src/blocs/on_boarding_bloc.dart';

class OnBoardingBlocProvider extends InheritedWidget {
  final OnBoardingBloc bloc = OnBoardingBloc();

  OnBoardingBlocProvider({
    Key key,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static OnBoardingBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(OnBoardingBlocProvider)
            as OnBoardingBlocProvider)
        .bloc;
  }

  @override
  bool updateShouldNotify(OnBoardingBlocProvider old) {
    return true;
  }
}
