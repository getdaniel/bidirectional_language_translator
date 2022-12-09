import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final textController = TextEditingController();
  final outputController = TextEditingController();

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
    final String response = await rootBundle.loadString('assets/files/language_dict.json');
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              obscureText: false,
              maxLines: 18,
              decoration: const InputDecoration(
                suffixIcon: Icon(
                  Icons.paste,
                  color: Colors.blue,
                ),
                border: OutlineInputBorder(),
                hintText:
                    "Enter Ge'ez word(s) or sentence(s) for translation...",
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
