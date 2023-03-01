import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pixabay_renew_mvvm_pattern/data/data_source/pixabay_api.dart';
import 'package:pixabay_renew_mvvm_pattern/domain/repositiry/photo_api_repository.dart';
import 'package:pixabay_renew_mvvm_pattern/domain/model/photo.dart';

class PhotoApiRepositiryImpl implements PhotoApiRepasitory {
  PixabayApi api;

  PhotoApiRepositiryImpl(this.api);

  @override
  Future<List<Photo>> fetch(String quary) async {
    String serchText = quary.replaceAll(' ', '+');
    final result = await api.fetch(serchText);

    return result.map((e) => Photo.fromJson(e)).toList();
  }
}
