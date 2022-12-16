import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Learn extends StatefulWidget {
  const Learn({Key? key}) : super(key: key);

  @override
  State<Learn> createState() => _LearnState();
}

class _LearnState extends State<Learn> {
  String? _data, _aplhabet, _numbers, _special;

  Future<void> whatGeez() async {
    final String response =
        await rootBundle.loadString('assets/texts/what_geez.txt');
    setState(() {
      _data = response;
    });
  }
  Future<void> alphabetGeez() async {
    final String response =
        await rootBundle.loadString('assets/texts/geez_alphabet.txt');
    setState(() {
      _aplhabet = response;
    });
  }
  Future<void> numbersGeez() async {
    final String response =
        await rootBundle.loadString('assets/texts/geez_number.txt');
    setState(() {
      _numbers = response;
    });
  }
  Future<void> geezSpecial() async {
    final String response =
        await rootBundle.loadString('assets/texts/geez_special.txt');
    setState(() {
      _special = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    whatGeez();
    alphabetGeez();
    numbersGeez();
    geezSpecial();
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
                  _numbers ?? "Nothing Data",
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
