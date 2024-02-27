import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class Articles {
  Future<List<Map>> getHeadlines() async {
    List<Map> headlines = [];

    http.Response response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=b40c8ff754314508a61f37a86c9e13f2"));

    if (response.statusCode == 200) {
      String jsonString = response.body;
      List data = jsonDecode(jsonString);
      headlines = data.cast<Map>();
    }

    return headlines;
  }

  Future<List<Map>> getSpecificArticles(String searchItem) async {
    List<Map> specificArticles = [];
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MMMM-dd').format(now);

    http.Response response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=$searchItem&from=$formattedDate&sortBy=popularity&apiKey=b40c8ff754314508a61f37a86c9e13f2"));

    if (response.statusCode == 200) {
      String jsonString = response.body;
      List data = jsonDecode(jsonString);
      specificArticles = data.cast<Map>();
    }

    return specificArticles;
  }
}
