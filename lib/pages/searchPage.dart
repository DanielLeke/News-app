import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Container(
          decoration: const BoxDecoration(
            color: Colors.white
          ),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontSize: 12,
              ),
              border: InputBorder.none
            ),
          ),
        ),
      ),
    );
  }
}