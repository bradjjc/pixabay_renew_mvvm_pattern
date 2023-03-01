import 'package:pixabay_renew_mvvm_pattern/data/data_source/result.dart';
import 'package:pixabay_renew_mvvm_pattern/domain/model/photo.dart';

abstract class PhotoApiRepasitory {
  Future<Result<List<Photo>>> fetch(String query);
}
