import 'package:flutter/material.dart';
import 'package:pixabay_renew_mvvm_pattern/model/photo.dart';
import 'package:pixabay_renew_mvvm_pattern/ui/home_view_model.dart';
import 'package:pixabay_renew_mvvm_pattern/ui/widget/photo_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    // final viewModel = Provider.of<HomeViewModel>(context);

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
                viewModel.fetch(value);
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                suffixIcon: IconButton(
                  onPressed: () async {
                    viewModel.fetch(_controller.text);
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          StreamBuilder<List<Photo>>(
              stream: viewModel.photoStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                final photos = snapshot.data;
                return Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: photos!.length, //item 개수
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
                      mainAxisSpacing: 16, //수평 Padding
                      crossAxisSpacing: 16, //수직 Padding
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      //item 의 반목문 항목 형성
                      final photo = photos[index];
                      return PhotoWidget(
                        photo: photo,
                      );
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}
