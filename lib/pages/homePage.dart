import 'package:flutter/material.dart';
import 'package:newapp/pages/searchPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String hintText = "Search";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Headlines",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
        backgroundColor: Colors.blue[200],
      ),
      drawer: Drawer(
          child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView(
          children: const [
            Text(
              "N E W S A P P",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About"),
            )
          ],
        ),
      )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SearchPage()));
              },
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.white),
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
            ),
          )
        ],
      ),
    );
  }
}
