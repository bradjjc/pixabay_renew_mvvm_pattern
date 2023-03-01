import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:pixabay_renew_mvvm_pattern/domain/repositiry/photo_api_repository.dart';
import 'package:pixabay_renew_mvvm_pattern/domain/model/photo.dart';

class HomeViewModel with ChangeNotifier {
  final PhotoApiRepasitory repasitory;

  List<Photo> _photos = [];

  UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);

  HomeViewModel(this.repasitory);

  Future<void> fetch(String query) async {
    final result = await repasitory.fetch(query);
    _photos = result;

    notifyListeners();
  }
}
