import 'package:pixabay_renew_mvvm_pattern/model/photo.dart';

abstract class PhotoApiRepasitory {
  Future<List<Photo>> fetch(String query);
}
