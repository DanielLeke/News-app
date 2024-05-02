import 'package:http/http.dart' as http;
import 'dart:convert';

//Headlines getting and parsing
Future<List<dynamic>> getAndParseNigeriaHeadlines() async {
  const String apiUrl = "https://newsapi.org/v2/top-headlines?country=ng&apiKey=b40c8ff754314508a61f37a86c9e13f2";

  List<dynamic> headlines = [];

  final response = await http.get(Uri.parse(apiUrl));
  if (response.statusCode == 200) {
    headlines = jsonDecode(response.body)['articles'];
  }
    return headlines;
}

Future<List<dynamic>> searchForStuff(String thingToSearchFor) async {
  List<dynamic> articles = [];
  var response = await http.get(Uri.parse(
      "https://newsapi.org/v2/everything?q=$thingToSearchFor&sortBy=popularity&apiKey=b40c8ff754314508a61f37a86c9e13f2"));
  if (response.statusCode == 200) {
    articles = jsonDecode(response.body)['articles'];
  }
  return articles;
}
