import 'package:flutter/material.dart';

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

  Widget buildTopStories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 12.0, left: 12.0),
          child: Text(
            'top stories',
            style: TextStyle(color: Colors.grey, fontSize: 15.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: <Widget>[
              _NewsCard(),
              Divider(
                color: Colors.grey,
                height: 1,
              ),
              _NewsCard(),
              Divider(
                color: Colors.grey,
                height: 1,
              ),
              _NewsCard(),
            ],
          ),
        ),
      ],
    );
  }
}

class _NewsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              height: 120,
              color: Colors.black87,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(16.0),
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'the world global warming annual summit',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Michal Adams',
                        style: TextStyle(color: Colors.black87, fontSize: 13.0),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.watch_later,
                            color: Colors.black54,
                          ),
                          Text(
                            '15 min',
                            style: TextStyle(color: Colors.black87),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
