import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'drawer.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});
  static const String routeName = "/settings";

  @override
  State<Settings> createState() => _SettingState();
}

class _SettingState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarState(),
      drawer: drawerState(context),
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text("Theme"),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text("Language"),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text("Font Size"),
          ),
        ],
      ),
    );
  }
}
