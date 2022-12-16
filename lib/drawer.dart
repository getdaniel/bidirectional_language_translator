import 'package:flutter/material.dart';
import 'about_us.dart';
import 'home.dart';
import 'know_geez.dart';

drawerState(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const UserAccountsDrawerHeader(
          accountName:
              Text("Language Translator", style: TextStyle(fontSize: 25)),
          accountEmail: Text("Ge'ez <-> Amharic",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.brown,
            child: Text(
              "ግዕዝ-አማርኛ",
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.home,
          ),
          title: const Text(
            "Home",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          onTap: () {
            const Home();
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.language,
          ),
          title: const Text(
            "Ge'ez",
            style: TextStyle(fontSize: 20),
          ),
          onTap: (() {
            const Learn();
            Navigator.pop(context);
          }),
        ),
        ListTile(
          leading: const Icon(
            Icons.person,
          ),
          title: const Text(
            "About",
            style: TextStyle(fontSize: 20),
          ),
          onTap: (() {
            const About();
            Navigator.pop(context);
          }),
        ),
      ],
    ),
  );
}
