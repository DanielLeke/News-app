import 'package:flutter/material.dart';
import 'package:newapp/utilities/httpHelper.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> articles = [];

  Future<void> _fetchData() async {
    final data = await searchForStuff(_searchController.text);
    try {
      setState(() {
        articles = data;
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
          title: TextField(
            controller: _searchController,
            decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 16,
                ),
                border: InputBorder.none),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  await _fetchData();
                },
                icon: const Icon(Icons.send))
          ],
        ),
        body: Search(articles: articles));
  }
}

class Search extends StatelessWidget {
  const Search({super.key, required this.articles});

  final List articles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        if (articles.isEmpty) {
          return const Center(
            child: Text("No information available"),
          );
        } else {
          return Column(
          children: [
            GestureDetector(
              onTap: () async {
                await launchUrl(Uri.parse(articles[index]['url']));
              },
              child: ListTile(
                title: Text(
                  articles[index]['title'].toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(articles[index]['author'].toString()),
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
    );
  }
}
