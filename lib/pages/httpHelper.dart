import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class Articles {
  Future<List<Map>> getHeadlines() async {
    List<Map> headlines = [];

    http.Response response = await http.get(Uri.parse(
        "https://serpapi.com/search?engine=google_news&q='Trending+Stories'&gl=ng"));

    if (response.statusCode == 200) {
      String jsonString = response.body;
      List data = jsonDecode(jsonString);
      headlines = data.cast<Map>();
    }

    return headlines;
  }

  Future<List<Map>> getSpecificArticles(String searchItem) async {
    List<Map> specificArticles = [];

    http.Response response = await http.get(Uri.parse(
        "https://serpapi.com/search?engine=google_news&q='$searchItem'&gl=ng"));

    if (response.statusCode == 200) {
      String jsonString = response.body;
      List data = jsonDecode(jsonString);
      specificArticles = data.cast<Map>();
    }

    return specificArticles;
  }
}
