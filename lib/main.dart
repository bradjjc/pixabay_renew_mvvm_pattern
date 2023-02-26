import 'package:flutter/material.dart';
import 'package:pixabay_renew_mvvm_pattern/data/photo_provider.dart';
import 'package:pixabay_renew_mvvm_pattern/ui/home_screen.dart';
import 'package:pixabay_renew_mvvm_pattern/ui/home_view_model.dart';
import 'data/pixabay_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PhotoProvider(
          viewModel: HomeViewModel(PixabayApi()), child: const HomeScreen()),
    );
  }
}
