import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // the textfield's controllers
  final textController = TextEditingController();
  final outputController = TextEditingController();

  // Initial Selected Value
  String dropdownvalue = "Ge'ez";

  // List of items in our dropdown menu
  var items = ["Ge'ez", 'Amharic'];

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    textController.addListener(readJson);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    textController.dispose();
    super.dispose();
  }

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/files/geez_amharic.json');
    Map lang = await json.decode(response);

    lang.forEach((key, value) {
      if ('$key' == textController.text) {
        outputController.text = '$value';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: DropdownButton(
                // Initial Value
                value: dropdownvalue,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextField(
              obscureText: false,
              maxLines: 18,
              decoration: const InputDecoration(
                suffixIcon: Icon(
                  Icons.paste,
                  color: Colors.blue,
                ),
                border: OutlineInputBorder(),
                hintText: "Enter word(s) or sentence(s) for translation...",
              ),
              controller: textController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              obscureText: false,
              maxLines: 18,
              enabled: false,
              decoration: const InputDecoration(
                suffixIcon: Icon(
                  Icons.copy_all,
                  color: Colors.blue,
                ),
                border: OutlineInputBorder(),
                hintText: "Translated items will appear here",
              ),
              controller: outputController,
            ),
          ),
        ],
      ),
    );
  }
}
