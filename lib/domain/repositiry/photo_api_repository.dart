import 'package:pixabay_renew_mvvm_pattern/domain/model/photo.dart';

abstract class PhotoApiRepasitory {
  Future<List<Photo>> fetch(String query);
}
