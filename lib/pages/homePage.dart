import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:newapp/pages/aboutPage.dart';
import 'package:newapp/pages/businessPage.dart';
import 'package:newapp/pages/searchPage.dart';
import 'package:newapp/pages/sportsPage.dart';
import 'package:newapp/utilities/httpHelper.dart';
import 'package:url_launcher/url_launcher.dart';
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
