import 'package:flutter/material.dart';
import 'package:pixabay_renew_mvvm_pattern/ui/home_view_model.dart';

class PhotoProvider extends InheritedWidget {
  final HomeViewModel viewModel;

  const PhotoProvider({
    Key? key,
    required this.viewModel,
    required Widget child,
  }) : super(key: key, child: child);

  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result =
        context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, 'No PhotoProvider found in context');
    return result!;
  }

  // 위젯이 변경이 됬다 하는 규칙
  @override
  bool updateShouldNotify(covariant PhotoProvider oldWidget) {
    return true;
  }
}
