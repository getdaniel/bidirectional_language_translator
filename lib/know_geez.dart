import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Learn extends StatefulWidget {
  const Learn({Key? key}) : super(key: key);

  @override
  State<Learn> createState() => _LearnState();
}

class _LearnState extends State<Learn> {
  String? _data, _aplhabet, _numbers, _example, _special;

  Future<void> whatGeez() async {
    final String what =
        await rootBundle.loadString('assets/texts/what_geez.txt');
    final String alphabet =
        await rootBundle.loadString('assets/texts/geez_alphabet.txt');
    final String numbers =
        await rootBundle.loadString('assets/texts/geez_number.txt');
    final String special =
        await rootBundle.loadString('assets/texts/geez_special.txt');
    final String example =
        await rootBundle.loadString('assets/texts/geez_example.txt');
    setState(() {
      _data = what;
      _aplhabet = alphabet;
      _numbers = numbers;
      _special = special;
      _example = example;
    });
  }

  @override
  Widget build(BuildContext context) {
    whatGeez();
    return Card(
      child: ListView(
        children: [
          ExpansionTile(
            title: const Text(
              "History of Ge'ez",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            children: [
              Align(
                child: Text(
                  _data ?? "Nothing Data",
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              )
            ],
          ),
          ExpansionTile(
            title: const Text(
              "Ge'ez's Alphabets",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            children: [
              Align(
                child: Text(
                  _aplhabet ?? "Nothing Data",
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              )
            ],
          ),
          ExpansionTile(
            title: const Text(
              "Ge'ez's Numbers",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            children: [
              Align(
                child: Text(
                  _numbers ?? "Nothing Data",
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              )
            ],
          ),
          ExpansionTile(
            title: const Text(
              "Examples",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            children: [
              Align(
                child: Text(
                  _example ?? "Nothing Data",
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              )
            ],
          ),
          ExpansionTile(
            title: const Text(
              "Amazing about Ge'ez",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            children: [
              Align(
                child: Text(
                  _special ?? "Nothing Data",
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              )
            ],
          ),
          ExpansionTile(
            title: const Text(
              "More About Ge'ez",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            children: [
              Align(
                child: Text(
                  _example ?? "Nothing Data",
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              )
            ],
          ),
          Image.asset("assets/images/ic_launcher.png"),
        ],
      ),
    );
  }
}
