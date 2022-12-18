import 'package:flutter/material.dart';
import 'about_us.dart';
import 'know_geez.dart';
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
            const Learn();
            Navigator.pop(context);
          }),
        ),
        ListTile(
          leading: const Icon(
            Icons.get_app_rounded,
          ),
          title: const Text(
            "About App",
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
