import 'package:flutter/material.dart';
import 'package:newapp/pages/businessPage.dart';
import 'package:newapp/pages/sportsPage.dart';
import 'package:newapp/pages/showPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> body = const [
    ShowPage(),
    SportsPage(),
    BusinessPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          selectedItemColor: Colors.purple[300],
          unselectedItemColor: Colors.blueGrey[400],
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.newspaper_sharp), label: "News"),
            BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sports"),
            BottomNavigationBarItem(
                icon: Icon(Icons.monetization_on_outlined), label: "Business")
          ]),
      body: body[_currentIndex],
    );
  }
}
