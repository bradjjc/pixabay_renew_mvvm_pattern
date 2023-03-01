import 'dart:convert';

import 'package:http/http.dart' as http;

class PixabayApi {
  final http.Client client;

  PixabayApi(this.client);

  static const baseUrl = 'https://pixabay.com/api/';
  static const key = '33944449-869c2910b825e571ac4fba36f';

  Future<Iterable> fetch(String quary) async {
    final response = await client.get(
      Uri.parse('$baseUrl?key=$key&q=$quary&image_type=photo&per_page=30'),
    );
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    // Iterable 반복자 타입
    Iterable hits = jsonResponse['hits'];
    return hits;
  }
}
