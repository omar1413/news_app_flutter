import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  List<String> navMenu = [
    'Explorer',
    'Headline News',
    'Read Later',
    'Vieos',
    'Photos',
    'Settings',
    'Logout',
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.70,
        child: Drawer(
          child: Padding(
            padding: const EdgeInsets.only(top: 52.0),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Center(
                    child: Text(
                      navMenu[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  trailing: Icon(Icons.chevron_right),
                );
              },
              itemCount: navMenu.length,
            ),
          ),
        ),
      ),
    );
  }
}
