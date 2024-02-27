import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App",
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
    );
  }
}
