import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'routes.dart';

Widget drawerState(BuildContext context) {
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
            Icons.home_rounded,
          ),
          title: const Text(
            "Get Started",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          onTap: () {
            Navigator.pushReplacementNamed(context, Routes.home);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.settings_rounded,
          ),
          title: const Text(
            "Settings",
            style: TextStyle(fontSize: 20),
          ),
          onTap: (() {
            Navigator.pushReplacementNamed(context, Routes.settings);
          }),
        ),
        ListTile(
          leading: const Icon(
            Icons.person_rounded,
          ),
          title: const Text(
            "About Us",
            style: TextStyle(fontSize: 20),
          ),
          onTap: (() {
            Navigator.pushReplacementNamed(context, Routes.about);
          }),
        ),
        ListTile(
          leading: const Icon(
            Icons.share_rounded,
          ),
          title: const Text(
            "Share App",
            style: TextStyle(fontSize: 20),
          ),
          onTap: (() {
            Share.share("Check out Ge'ez-Amharic App", subject: "This app may help you!");
          }),
        ),
      ],
    ),
  );
}
