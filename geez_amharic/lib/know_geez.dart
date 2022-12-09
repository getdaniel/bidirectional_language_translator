import 'package:flutter/material.dart';

class Learn extends StatelessWidget {
  const Learn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Why Ge'ez Language?",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Ge'ez is an ancient Ethiopian Semitic language."
              "The language originates from what is now northern Ethiopia and Eritrea."
              "I am proud of being Ethiopian!",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}