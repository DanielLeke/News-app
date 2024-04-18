import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newapp/pages/aboutPage.dart';
import 'package:newapp/pages/searchPage.dart';
import 'package:newapp/pages/httpHelper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String hintText = "Search";
  List<dynamic> headlines = [];

  Future<void> _fetchData() async {
    final data = await getAndParseHeadlines();
    try {
      setState(() {
        headlines = data;
      });
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Center(
          child: Text("Headlines",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBar(
              hintText: hintText,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(child: FutureHeadlines(headlines: headlines)),
        ],
      ),
    );
  }
}

class FutureHeadlines extends StatelessWidget {
  const FutureHeadlines({
    super.key,
    required this.headlines,
  });

  final List headlines;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: headlines.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            GestureDetector(
              child: ListTile(
                title: Text(
                  headlines[index]['title'].toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(headlines[index]['author'].toString()),
              ),
            ),
            const Divider(
              indent: 30.0,
              endIndent: 30.0,
            )
          ],
        );
      },
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.hintText,
  });

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchPage(),
            ));
      },
      child: Container(
        height: 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.white),
        child: Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            const Icon(Icons.search),
            const SizedBox(
              width: 10,
            ),
            Text(
              hintText,
              style: const TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
