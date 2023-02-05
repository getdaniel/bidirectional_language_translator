import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  String dropdownvalue = "Ge'ez to Amharic";

  // List of items in our dropdown menu
  var items = ["Ge'ez to Amharic", "Amharic to Ge'ez"];

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
      if (dropdownvalue == "Ge'ez to Amharic") {
        if ('$key' == textController.text) {
          outputController.text = '$value';
        }
        else {
          outputController.text = translate(textController.text) as String;
        }
      } else {
        if ('$value' == textController.text) {
          outputController.text = '$key';
        }
        else {
          outputController.text = translate(textController.text) as String;
        }
      }
    });
  }

  Future<void> loadModel() async {
      await Tflite.loadModel(
          model: "assets/translate.tflite",
          labels: "assets/files/geez_amharic.txt"
      );
  }

  Future<String> translate(String input) async {
      // Preprocess the input string
      var inputArray = _convertStringToInputArray(textController.text);

      // Convert the input array to a Uint8List
    var inputByteData = Uint8List.fromList(inputArray);


      // Run the model on the input array
      var output = await Tflite.runModelOnBinary(
          binary: inputByteData,
          numResults: 2,
          threshold: 0.5,
      );

      // Postprocess the output
      if (output != null) {
        List<int> castOutput = output.cast<int>();
        String translation = _convertOutputToString(castOutput);

        return translation;
        } else {
          return "";
          }
  }

  List<int> _convertStringToInputArray(String input) {
      // code to convert the string input to an array of integers
      // depends on the specific preprocessing steps required by your model
      return input.split(' ').map(int.parse).toList();
  }

  String _convertOutputToString(List<int> output) {
      // code to convert the output of the model to a string
      // depends on the specific postprocessing steps required by your model
      return output.map((int element) => element.toString()).join(",");
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
