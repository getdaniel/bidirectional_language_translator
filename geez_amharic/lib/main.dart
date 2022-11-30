import 'package:flutter/material.dart';

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
      ),
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

  static const List<Widget> _widgetOptions = <Widget>[
    Padding(
      padding: EdgeInsets.all(5.0),
      child: TextField(
        obscureText: false,
        maxLines: 15,
        decoration: InputDecoration(
          // labelText: "Ge'ez",
          border: OutlineInputBorder(),
          hintText: "Enter Ge'ez word(s) or sentence(s) for translation...",
        ),
      ),
    ),
    Padding(
      padding: EdgeInsets.all(5.0),
      child: Center(
        child: Text("Learn About Ge'ez", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
      ),
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            _widgetOptions.elementAt(_selectedIndex),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName:
                  Text("Language Translator", style: TextStyle(fontSize: 25)),
              accountEmail: Text("Developed By: YDY",
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
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
              ),
              title: const Text(
                "About Us",
                style: TextStyle(fontSize: 20),
              ),
              onTap: (() {
                Navigator.pop(context);
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.teal,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            backgroundColor: Colors.teal,
            label: "Learn Ge'ez",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        iconSize: 35,
        onTap: _onItemTapped,
        backgroundColor: Colors.grey,
      ),
    );
  }
}
