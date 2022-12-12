import 'package:flutter/material.dart';
import 'package:simple_language_translator/about_us.dart';
import 'package:simple_language_translator/home.dart';
import 'package:simple_language_translator/know_geez.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Language Translation',
      theme: ThemeData(
          primarySwatch: Colors.teal,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Simple Language Translator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final pages = [
    const Home(),
    const Learn(),
    const About(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: pages[_selectedIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName:
                  Text("Language Translator", style: TextStyle(fontSize: 25)),
              accountEmail: Text("Geez-Amharic",
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
                Icons.home,
              ),
              title: const Text(
                "Home",
                style: TextStyle(fontSize: 20,),
              ),
              onTap: () {
                const Home();
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.language,
              ),
              title: const Text(
                "Ge'ez",
                style: TextStyle(fontSize: 20),
              ),
              onTap: (() {
                const Learn();
                Navigator.pop(context);
              }),
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
              ),
              title: const Text(
                "About",
                style: TextStyle(fontSize: 20),
              ),
              onTap: (() {
                const About();
                Navigator.pop(context);
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _selectedIndex = 0;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (_selectedIndex == 0)
                  const Icon(Icons.home_filled)
                else
                  const Icon(Icons.home_outlined),
                const Text(
                  "Home",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _selectedIndex = 1;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (_selectedIndex == 1)
                  const Icon(Icons.school_rounded)
                else
                  const Icon(Icons.school_outlined),
                const Text(
                  "Know Ge'ez",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _selectedIndex = 2;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (_selectedIndex == 2)
                  const Icon(Icons.person_rounded)
                else
                  const Icon(Icons.person_outlined),
                const Text(
                  "About",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
