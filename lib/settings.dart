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
  RangeValues _rangeValues = const RangeValues(12, 48);

  RangeValues get fontSizer => _rangeValues;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarState(),
      drawer: drawerState(context),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              child: Column(
                children: [
                  const Text(
                    "Select Theme",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Card(
                    child: RadioListTile(
                      title: const Text("System default Mode"),
                      selectedTileColor: Colors.teal,
                      value: "red",
                      groupValue: Colors.red,
                      onChanged: (value) {},
                    ),
                  ),
                  Card(
                    child: RadioListTile(
                      title: const Text("Dark Mode"),
                      selectedTileColor: Colors.teal,
                      value: "red",
                      groupValue: Colors.red,
                      onChanged: (value) {},
                    ),
                  ),
                  Card(
                    child: RadioListTile(
                      title: const Text("Light Mode"),
                      selectedTileColor: Colors.teal,
                      value: "red",
                      groupValue: Colors.red,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              child: Column(
                children: [
                  const Text(
                    "Select Language",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Card(
                    child: RadioListTile(
                      title: const Text("English"),
                      selectedTileColor: Colors.teal,
                      value: "red",
                      groupValue: Colors.red,
                      onChanged: (value) {},
                    ),
                  ),
                  Card(
                    child: RadioListTile(
                      title: const Text("Amharic"),
                      selectedTileColor: Colors.teal,
                      value: "red",
                      groupValue: Colors.red,
                      onChanged: (value) {},
                    ),
                  ),
                  Card(
                    child: RadioListTile(
                      title: const Text("Tigirigna"),
                      selectedTileColor: Colors.teal,
                      value: "red",
                      groupValue: Colors.red,
                      onChanged: (value) {},
                    ),
                  ),
                  Card(
                    child: RadioListTile(
                      title: const Text("Oromigna"),
                      selectedTileColor: Colors.teal,
                      value: "red",
                      groupValue: Colors.red,
                      onChanged: (value) {},
                    ),
                  ),
                  Card(
                    child: RadioListTile(
                      title: const Text("Somaligna"),
                      selectedTileColor: Colors.teal,
                      value: "red",
                      groupValue: Colors.red,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              child: Column(
                children: [
                  const Text(
                    "Adjust Font Size",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Card(
                    child: RangeSlider(
                      values: _rangeValues,
                      min: 12,
                      max: 48,
                      divisions: 2,
                      labels: RangeLabels(
                        '${_rangeValues.start.round()}',
                        '${_rangeValues.end.round()}',
                      ),
                      onChanged: (value) {
                        setState(() {
                          _rangeValues = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
