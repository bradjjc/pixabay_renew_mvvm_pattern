import 'dart:async';
import 'package:pixabay_renew_mvvm_pattern/data/pixabay_api.dart';
import 'package:pixabay_renew_mvvm_pattern/model/photo.dart';

class HomeViewModel {
  final PixabayApi api;

  final _photoStreamController = StreamController<List<Photo>>()..add([]);
  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  HomeViewModel(this.api);

  Future<void> fetch(String query) async {
    final result = await api.fetch(query);
    _photoStreamController.add(result);
  }
}
