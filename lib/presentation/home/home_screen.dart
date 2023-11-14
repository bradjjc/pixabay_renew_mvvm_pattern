import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pixabay_renew_mvvm_pattern/presentation/home/home_view_model.dart';
import 'package:pixabay_renew_mvvm_pattern/presentation/home/components/photo_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _controller = TextEditingController();
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeViewModelProvider);
    final notifier = ref.read(homeViewModelProvider.notifier);

    return state.when(
      data: (data) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Text(
              'Image Search',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _controller,
                  onSubmitted: (value) async {
                    // viewModel.fetch(value);
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () async {
                        // viewModel.fetch(_controller.text);
                      },
                      icon: const Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: data?.length ?? 0, //item 개수
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
                    mainAxisSpacing: 16, //수평 Padding
                    crossAxisSpacing: 16, //수직 Padding
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    //item 의 반목문 항목 형성
                    final photo = data![index];
                    return PhotoWidget(
                      photo: photo,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) => const Center(child: Text('error')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
