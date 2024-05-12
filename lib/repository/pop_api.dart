import 'dart:convert';
import 'dart:core';
import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:popcorn/repository/query_parameter.dart';

class PopApi {
  String get apiKey => dotenv.env['API_KEY'] ?? '';

  Future<List<dynamic>> getTheMovieDB(
      {required String path, List<QueryParameter>? parameterList}) async {
    String params = parameterList != null ? parameterList.toQueryString() : '';
    String url = 'https://api.themoviedb.org/3/$path?api_key=$apiKey$params';
    Uri uri = Uri.parse(url);
    log('url: $url');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData;
    } else {
      throw Exception('Connection Error: ${response.statusCode}');
    }
  }
}

extension on List<QueryParameter> {
  String toQueryString() {
    return map((e) => '&${e.toString()}').join();
  }
}
