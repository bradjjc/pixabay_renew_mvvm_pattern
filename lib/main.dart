import 'package:flutter/material.dart';
import 'package:pixabay_renew_mvvm_pattern/data/data_source/pixabay_api.dart';
import 'package:pixabay_renew_mvvm_pattern/data/repositiry/photo_api_repository_impl.dart';
import 'package:pixabay_renew_mvvm_pattern/presentation/home/home_screen.dart';
import 'package:pixabay_renew_mvvm_pattern/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

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
      home: ChangeNotifierProvider(
          create: (_) =>
              HomeViewModel(PhotoApiRepositiryImpl(PixabayApi(http.Client()))),
          child: const HomeScreen()),
    );
  }
}
