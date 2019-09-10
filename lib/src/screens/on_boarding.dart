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
  int currentIndex = 0;
  final _indicatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final bloc = OnBoardingBlocProvider.of(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          buildPageView(bloc),
          buildPageIndicators(bloc),
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
      stream: bloc.models,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return PageView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return pageItem(snapshot.data[index]);
            },
            onPageChanged: (index) {
              print(index);
              getIndicatorPosition();
              bloc.changeIndicator(index);
            },
          );
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
    return Padding(
      padding: EdgeInsets.only(bottom: 100.0),
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
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget buildDescriptionText(String desc) {
    return Padding(
      padding: EdgeInsets.only(bottom: 140.0),
      child: Text(
        desc,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18.0,
        ),
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
            buildDescriptionText(data.description),
          ],
        ),
      ],
    );
  }

  Widget buildPageIndicators(OnBoardingBloc bloc) {
    return StreamBuilder<Map<int, int>>(
      stream: bloc.indicator,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text('hello');
        }
        print(snapshot.data.values.first);
        final widgets = <Widget>[];

        for (int i = 0; i < snapshot.data.keys.first; i++) {
          widgets.add(PageIndicator(
            i,
            snapshot.data.values.first,
          ));
        }
        return Center(
          child: Container(
            transform: Matrix4.translationValues(0, 100.0, 0),
            width: double.infinity,
            height: 50.0,
            child: Row(
              key: _indicatorKey,
              mainAxisAlignment: MainAxisAlignment.center,
              children: widgets,
            ),
          ),
        );
      },
    );
  }

  void getIndicatorPosition() {
    RenderBox indicatorRenderBox =
        _indicatorKey.currentContext.findRenderObject();
    print(indicatorRenderBox.localToGlobal(Offset.zero));
  }
}

class PageIndicator extends StatelessWidget {
  final int index;
  final Color activeColor;
  final Color inActiveColor;
  final int currentIndex;

  PageIndicator(this.index, this.currentIndex,
      {Key key,
      this.activeColor = Colors.red,
      this.inActiveColor = Colors.grey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.0),
      width: 13.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: index == currentIndex ? activeColor : inActiveColor,
      ),
    );
  }
}
