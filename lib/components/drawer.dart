import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/cover2.jpg'),
              ),
            ),
            child: Text(
              'Username',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text('Classrooms'),
            onTap: () {
              // Add your custom action here
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications_none_outlined),
            title: Text('Notifications'),
            onTap: () {
              // Add your custom action here
            },
          ),
        ],
      ),
    );
  }
}