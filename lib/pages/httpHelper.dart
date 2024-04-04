import 'package:http/http.dart' as http;
import 'dart:convert';

class Articles {
  Future<List<Map>> getHeadlines() async {
    List<Map> headlines = [];

    http.Response response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=ng&apiKey=b40c8ff754314508a61f37a86c9e13f2"));

    if (response.statusCode == 200) {
      String jsonString = response.body;
      List data = jsonDecode(jsonString);
      headlines = data.cast<Map>();
    }

    return headlines;
  }

  Future<List<Map>> getSpecificArticles(String searchItem) async {
    List<Map> specificArticles = [];
    DateTime date = DateTime.now();

    http.Response response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=$searchItem&from=$date&sortBy=popularity&apiKey=b40c8ff754314508a61f37a86c9e13f2"));

    if (response.statusCode == 200) {
      String jsonString = response.body;
      List data = jsonDecode(jsonString);
      specificArticles = data.cast<Map>();
    }

    return specificArticles;
  }
}
