import 'package:http/http.dart' as http;
import 'dart:convert';

//Headlines getting and parsing
Future<List<dynamic>> getAndParseHeadlines() async {
  List<dynamic> headlines = [];
  var response = await http.get(Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=ng&apiKey=b40c8ff754314508a61f37a86c9e13f2"));
  if (response.statusCode == 200) {
    Map<String, dynamic> decodedResponse = jsonDecode(response.body);
    headlines = decodedResponse['articles'];
  }
  return headlines;
}


