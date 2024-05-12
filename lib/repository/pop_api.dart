import 'dart:convert';
import 'package:http/http.dart' as http;

class PopApi {
  Future<List<dynamic>> getTheMovieDB(String path)async{
    String apiKey = "";
    Uri uri = Uri.parse('https://api.themoviedb.org/3/$path?api_key=$apiKey');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData;
    } else {
      throw Exception('Connection Error: ${response.statusCode}');
    }
  }

  Future<String> getDatabase() async {
    Uri uri = Uri.parse("https://api.themoviedb.org/3/configuration");
    String token =
        "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1ZDdiNWFjNDI4ZGQyZTQ0ODMwZWQ2YTNjNzUwNWY4OSIsInN1YiI6IjYxMTI4M2IyY2QyMDQ2MDA1ZjEyN2ZlZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.tDtRFcgHhCJnxIXGs0KjqigNtjpB22wxggQrsh0rN4Y";

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    };

    final response = await http.head(uri, headers: headers);

    return jsonDecode(response.body.toString());
  }
}
