import 'package:http/http.dart' as http;
import 'dart:convert';

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
}
