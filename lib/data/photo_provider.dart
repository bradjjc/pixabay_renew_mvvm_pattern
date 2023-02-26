import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pixabay_renew_mvvm_pattern/data/pixabay_api.dart';
import 'package:pixabay_renew_mvvm_pattern/model/photo.dart';

class PhotoProvider extends InheritedWidget {
  final PixabayApi api;

  final _photoStreamController = StreamController<List<Photo>>()..add([]);
  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  PhotoProvider({
    Key? key,
    required this.api,
    required Widget child,
  }) : super(key: key, child: child);

  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result =
        context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, 'No PhotoProvider found in context');
    return result!;
  }

  Future<void> fetch(String query) async {
    final result = await api.fetch(query);
    _photoStreamController.add(result);
  }

  // 위젯이 변경이 됬다 하는 규칙
  @override
  bool updateShouldNotify(covariant PhotoProvider oldWidget) {
    return oldWidget.api != api;
  }
}
