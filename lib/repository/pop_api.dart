import 'dart:convert';
import 'dart:core';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:popcorn/repository/query_parameter.dart';

class PopApi {
  String get apiKey => dotenv.env['API_KEY'] ?? '';

  Future<List<dynamic>> getTheMovieDB(
      {required String path, List<QueryParameter>? parameterList}) async {
    Uri uri = Uri.parse(
        'https://api.themoviedb.org/3/$path?api_key=$apiKey${parameterList?.toQueryString()}');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData;
    } else {
      throw Exception('Connection Error: ${response.statusCode}');
    }
  }
}

extension on List<QueryParameter>? {
  String toQueryString() {
    return this?.map((e) => '&${e.toString()}').join() ?? '';
  }
}
