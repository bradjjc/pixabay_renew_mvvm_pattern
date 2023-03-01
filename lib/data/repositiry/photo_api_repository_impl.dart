import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pixabay_renew_mvvm_pattern/data/data_source/pixabay_api.dart';
import 'package:pixabay_renew_mvvm_pattern/data/data_source/result.dart';
import 'package:pixabay_renew_mvvm_pattern/domain/repositiry/photo_api_repository.dart';
import 'package:pixabay_renew_mvvm_pattern/domain/model/photo.dart';

class PhotoApiRepositiryImpl implements PhotoApiRepasitory {
  PixabayApi api;

  PhotoApiRepositiryImpl(this.api);

  @override
  Future<Result<List<Photo>>> fetch(String quary) async {
    String serchText = quary.replaceAll(' ', '+');
    final Result<Iterable> result = await api.fetch(serchText);

    return result.when(
      success: (iterable) {
        return Result.success(iterable.map((e) => Photo.fromJson(e)).toList());
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }
}
