import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pixabay_renew_mvvm_pattern/data/photo_api_repository.dart';
import 'package:pixabay_renew_mvvm_pattern/model/photo.dart';

class PixabayApi implements PhotoApiRepasitory {
  final baseUrl = 'https://pixabay.com/api/';
  final key = '33944449-869c2910b825e571ac4fba36f';

  @override
  Future<List<Photo>> fetch(String quary) async {
    String serchText = quary.replaceAll(' ', '+');
    final response = await http.get(
      Uri.parse('$baseUrl?key=$key&q=$serchText&image_type=photo'),
    );
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    // Iterable 반복자 타입
    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}
