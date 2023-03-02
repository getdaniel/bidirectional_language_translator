import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'classifier.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // the textfield's controllers
  final textController = TextEditingController();
  final outputController = TextEditingController();

  final _classifier = Classifier();

  // Initial Selected Value
  String dropdownvalue = "Ge'ez to Amharic";

  // List of items in our dropdown menu
  var items = ["Ge'ez to Amharic", "Amharic to Ge'ez"];

  @override
  void initState() {
    super.initState();
    textController.addListener(translate);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    textController.dispose();
    super.dispose();
  }

  // Fetch content from the json file
  Future<void> translate() async {
    final String response =
        await rootBundle.loadString('assets/files/geez_amharic.json');
    Map lang = await json.decode(response);

    String inputText = textController.text;
    String outputText = '';

    if (dropdownvalue == "Ge'ez to Amharic") {
      if (lang.containsKey(inputText)) {
        outputText = lang[inputText];
      } else {
        outputText = _classifier.classify(inputText);
      }
    } else {
      lang.forEach((key, value) {
        if (value == inputText) {
          outputText = key;
        }
      });
      if (outputText.isEmpty) {
        outputText = _classifier.classify(inputText);
      }
    }

    setState(() {
      outputController.text = outputText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                // Initial Value
                value: dropdownvalue,
                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),
                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem<String>(
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
                iconEnabledColor: Colors.teal,
                buttonWidth: 300,
                buttonPadding: const EdgeInsets.only(left: 15, right: 15),
                buttonDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.teal,
                  ),
                ),
                itemHeight: 40,
                itemPadding: const EdgeInsets.only(left: 15, right: 15),
                dropdownWidth: 300,
                offset: const Offset(0, -3),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.teal,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            obscureText: false,
            maxLines: 18,
            cursorColor: Colors.teal,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () async {
                    ClipboardData? data = await Clipboard.getData("text/plain");
                    String? text = data?.text;
                    textController.text = text!;

                    // Show the toast message
                    Fluttertoast.showToast(
                      msg: "Text pasted from the clipboard",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 2,
                      fontSize: 16,
                      textColor: Colors.blue,
                      backgroundColor: Colors.white,
                    );
                  },
                  icon: const Icon(
                    Icons.paste,
                    color: Colors.blue,
                  ),
                ),
                border: const OutlineInputBorder(),
                hintText: "Enter word(s) or sentence(s) for translation...",
                hintStyle: const TextStyle(color: Colors.teal)),
            controller: textController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            obscureText: false,
            maxLines: 18,
            readOnly: true,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.copy_all,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    Clipboard.setData(
                        ClipboardData(text: outputController.text));

                    // Show the toast message
                    Fluttertoast.showToast(
                      msg: "Text copied to the clipboard",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 2,
                      fontSize: 16,
                      textColor: Colors.blue,
                      backgroundColor: Colors.white,
                    );
                  },
                ),
                border: const OutlineInputBorder(),
                hintText: "Translated items will appear here",
                hintStyle: const TextStyle(color: Colors.teal)),
            controller: outputController,
          ),
        ),
      ],
    );
  }
}
