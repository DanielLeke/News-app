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
  final Future<List<Map>> _futureHeadlines = Articles().getHeadlines();

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
          children: [
            const Text(
              "N E W S A P P",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const AboutPage()));
              },
              child: const ListTile(
                leading: Icon(Icons.info),
                title: Text("About"),
              ),
            )
          ],
        ),
      )),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SearchPage()));
              },
              child: SearchBar(hintText: hintText),
            ),
          ),
          FutureBuilder(
            future: _futureHeadlines,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                Center(
                  child: Text(
                    "An error occurred ${snapshot.error}",
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              }
              if (snapshot.hasData) {
                List<Map>? articles = snapshot.data;

                return ListView.builder(
                  itemCount: articles!.length,
                  itemBuilder: (context, index) {
                    Map thisArticle = articles[index];

                    return ListTile(
                      leading: const Icon(Icons.article),
                      title: Text(thisArticle['title'] ?? 'No Title'),
                      subtitle: Text(thisArticle['description'] ??
                          'No description avialable'),
                    );
                  },
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          )
        ],
      ),
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
    return Container(
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
    );
  }
}
