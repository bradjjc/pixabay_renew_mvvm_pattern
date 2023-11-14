import 'package:pixabay_renew_mvvm_pattern/data/data_source/pixabay_api.dart';
import 'package:pixabay_renew_mvvm_pattern/data/data_source/result.dart';
import 'package:pixabay_renew_mvvm_pattern/data/repositiry/photo_api_repository_impl.dart';
import 'package:pixabay_renew_mvvm_pattern/domain/model/photo.dart';
import 'package:pixabay_renew_mvvm_pattern/domain/repositiry/photo_api_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  late final PhotoApiRepasitory repository;

  @override
  Future<List<Photo>?> build() async {
    repository = PhotoApiRepositiryImpl(PixabayApi(http.Client()));

    final Result<List<Photo>> result = await repository.fetch('iphone');

    List<Photo> _photos = [];

    result.when(success: (photos) {
      _photos = photos;
    }, error: (message) {
      print('error: $message');
    });

    return _photos;
  }
}

// import 'dart:async';
// import 'dart:collection';
// import 'package:flutter/material.dart';
// import 'package:pixabay_renew_mvvm_pattern/data/data_source/result.dart';
// import 'package:pixabay_renew_mvvm_pattern/domain/repositiry/photo_api_repository.dart';
// import 'package:pixabay_renew_mvvm_pattern/domain/model/photo.dart';
// import 'package:pixabay_renew_mvvm_pattern/presentation/home/home_ui_event.dart';
//
// class HomeViewModel with ChangeNotifier {
//   final PhotoApiRepasitory repository;
//
//   List<Photo> _photos = [];
//
//   HomeViewModel(this.repository);
//
//   UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);
//
//   final _eventController = StreamController<HomeUiEvent>();
//   Stream<HomeUiEvent> get eventStream => _eventController.stream;
//
//   Future<void> fetch(String query) async {
//     final Result<List<Photo>> result = await repository.fetch(query);
//
//     result.when(success: (photos) {
//       _photos = photos;
//       notifyListeners();
//     }, error: (message) {
//       print(message);
//       _eventController.add(HomeUiEvent.showSnackBar(message));
//     });
//   }
// }
