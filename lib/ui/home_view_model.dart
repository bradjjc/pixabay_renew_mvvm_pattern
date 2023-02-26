import 'dart:async';
import 'package:pixabay_renew_mvvm_pattern/data/photo_api_repository.dart';
import 'package:pixabay_renew_mvvm_pattern/data/pixabay_api.dart';
import 'package:pixabay_renew_mvvm_pattern/model/photo.dart';

class HomeViewModel {
  final PhotoApiRepasitory repasitory;

  final _photoStreamController = StreamController<List<Photo>>()..add([]);
  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  HomeViewModel(this.repasitory);

  Future<void> fetch(String query) async {
    final result = await repasitory.fetch(query);
    _photoStreamController.add(result);
  }
}
