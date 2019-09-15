import 'package:flutter/material.dart';

import '../header_text.dart';
import '../news_card.dart';
import '../time_view.dart';

class WhatsNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color.fromARGB(240, 240, 240, 240),
        child: Column(
          children: <Widget>[
            buildHeader(context),
            buildTopStories(),
            buildRecentUpdates(),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    final titleStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
    final descriptionStyle = TextStyle(
      fontSize: 16,
      color: Colors.grey.shade400,
    );
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      color: Colors.black87,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 16.0, left: 16.0),
            child: Text(
              'title tile tile',
              style: titleStyle,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.0, left: 10.0),
            child: Text(
              'description description description description descriptiondescription description description description',
              style: descriptionStyle,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 12.0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildSectionBody({List<Widget> widgets = const []}) {
    return Padding(
      padding: EdgeInsets.all(14.0),
      child: Column(
        children: widgets,
      ),
    );
  }

  Widget buildTopStories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildSectionTitle('Top Stories'),
        buildSectionBody(
          widgets: <Widget>[
            NewsCard(),
            Divider(
              color: Colors.grey,
              height: 1,
            ),
            NewsCard(),
            Divider(
              color: Colors.grey,
              height: 1,
            ),
            NewsCard(),
          ],
        ),
      ],
    );
  }

  Widget buildRecentUpdates() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        buildSectionTitle('Recent Updates'),
        buildSectionBody(widgets: [
          UpdateCard(),
          Divider(height: 8.0),
          UpdateCard(),
          Divider(height: 8.0),
          UpdateCard(),
          Divider(height: 8.0),
        ]),
      ],
    );
  }
}

class UpdateCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      elevation: 5,
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.black54.withOpacity(1),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0, left: 16.0),
              padding: EdgeInsets.only(
                  left: 32.0, right: 32.0, top: 2.0, bottom: 2.0),
              child: Text('Sport'),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.teal.withOpacity(1),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0, left: 16.0),
              child: HeaderText('Vette is Ferrari Number One - Hamilton'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0, left: 16.0, bottom: 8.0),
              child: TimeView('15 Min'),
            ),
          ],
        ),
      ),
    );
  }
}
