import 'package:flutter/material.dart';
import 'package:newapp/utilities/httpHelper.dart';
import 'package:url_launcher/url_launcher.dart';

class SportsPage extends StatefulWidget {
  const SportsPage({super.key});

  @override
  State<SportsPage> createState() => _SportsPageState();
}

class _SportsPageState extends State<SportsPage> {
  List<dynamic> _sportsArticles = [];
  Future<void> _fetchData() async {
    final data = await searchForStuff("Soccer, football and sports news");
    try {
      setState(() {
        _sportsArticles = data;
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
          child: Text(
            "Sports News",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
        ),
      ),
      body: ListView.builder(
      itemCount: _sportsArticles.length,
      itemBuilder: (context, index) {
        if (_sportsArticles.isEmpty) {
          return const Center(
            child: Text("No information available"),
          );
        } else {
          return Column(
          children: [
            GestureDetector(
              onTap: () async {
                await launchUrl(Uri.parse(_sportsArticles[index]['url']));
              },
              child: ListTile(
                title: Text(
                  _sportsArticles[index]['title'].toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(_sportsArticles[index]['author'].toString()),
              ),
            ),
            const Divider(
              indent: 30.0,
              endIndent: 30.0,
            )
          ],
        );
        }
      },
    ),
    );
  }
}
