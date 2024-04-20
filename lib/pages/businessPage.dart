import 'package:flutter/material.dart';
import 'package:newapp/utilities/httpHelper.dart';
import 'package:url_launcher/url_launcher.dart';

class BusinessPage extends StatefulWidget {
  const BusinessPage({super.key});

  @override
  State<BusinessPage> createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  List<dynamic> _businessArticles = [];
  Future<void> _fetchData() async {
    final data = await searchForStuff("Trading and business news");
    try {
      setState(() {
        _businessArticles = data;
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
            "Business News",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
        ),
      ),
      body: ListView.builder(
      itemCount: _businessArticles.length,
      itemBuilder: (context, index) {
        if (_businessArticles.isEmpty) {
          return const Center(
            child: Text("No information available"),
          );
        } else {
          return Column(
          children: [
            GestureDetector(
              onTap: () async {
                await launchUrl(Uri.parse(_businessArticles[index]['url']));
              },
              child: ListTile(
                title: Text(
                  _businessArticles[index]['title'].toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(_businessArticles[index]['author'].toString()),
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
