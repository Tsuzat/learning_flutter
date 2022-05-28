import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle textStyle(double size, Color color) {
  return TextStyle(
    fontSize: size,
    color: color,
  );
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  final _imageURL = "https://imgflip.com/s/meme/Smiling-Cat.jpg";

  ListTile _drawerItems(Icon icon, String title) {
    return ListTile(
      leading: icon,
      iconColor: Colors.white,
      title: Text(
        title,
        style: textStyle(16, Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                accountName: Text(
                  "account name",
                  style: textStyle(14, Colors.white),
                ),
                accountEmail: Text(
                  "account@name.com",
                  style: textStyle(14, Colors.white),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(_imageURL),
                ),
              ),
            ),
            _drawerItems(const Icon(CupertinoIcons.home), 'Home'),
            _drawerItems(const Icon(CupertinoIcons.person_alt_circle), 'Profile'),
            _drawerItems(const Icon(CupertinoIcons.mail), 'Email Me'),
            _drawerItems(const Icon(CupertinoIcons.phone), '+91 000 000 0000'),
          ],
        ),
      ),
    );
  }
}
