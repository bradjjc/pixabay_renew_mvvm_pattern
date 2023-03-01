import 'package:flutter_test/flutter_test.dart';
import 'package:pixabay_renew_mvvm_pattern/data/photo_api_repository.dart';
import 'package:pixabay_renew_mvvm_pattern/data/pixabay_api.dart';
import 'package:pixabay_renew_mvvm_pattern/model/photo.dart';
import 'package:pixabay_renew_mvvm_pattern/ui/home_view_model.dart';

void main() {
  test('Stream is running well', () async {
    final viewModel = HomeViewModel(FackPhotoApiRepasitory());

    await viewModel.fetch('apple');

    final result = fakeJson.map((e) => Photo.fromJson(e)).toList();

    expect(viewModel.photos, result);
  });
}

class FackPhotoApiRepasitory extends PhotoApiRepasitory {
  @override
  Future<List<Photo>> fetch(String query) async {
    Future.delayed(const Duration(milliseconds: 500));

    return fakeJson.map((e) => Photo.fromJson(e)).toList();
  }
}

List<Map<String, dynamic>> fakeJson = [
  {
    "id": 2295434,
    "pageURL":
        "https://pixabay.com/photos/spring-bird-bird-tit-spring-blue-2295434/",
    "type": "photo",
    "tags": "spring bird, bird, tit",
    "previewURL":
        "https://cdn.pixabay.com/photo/2017/05/08/13/15/spring-bird-2295434_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/g67367e4567f0dbbe3a8360b7a06e02f1b0c3e57d3f5d81a3b36d783ba15201266c04425f1f53ced41554bd447658efe1a5b9ecc9a13dd3e6bdafab16ca7c0379_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL":
        "https://pixabay.com/get/g37ce11f8aca19849ca05b4919787c32a5faaf5925bc6eee55f7c434d5462d3b71410335610ede51d26b7827159bba82f8e67cef9ed0202f558ef0019e06cadeb_1280.jpg",
    "imageWidth": 5363,
    "imageHeight": 3575,
    "imageSize": 2938651,
    "views": 641734,
    "downloads": 372041,
    "collections": 2092,
    "likes": 2003,
    "comments": 254,
    "user_id": 334088,
    "user": "JillWellington",
    "userImageURL":
        "https://cdn.pixabay.com/user/2018/06/27/01-23-02-27_250x250.jpg"
  },
  {
    "id": 3063284,
    "pageURL":
        "https://pixabay.com/photos/rose-flower-petal-floral-noble-3063284/",
    "type": "photo",
    "tags": "rose, flower, petal",
    "previewURL":
        "https://cdn.pixabay.com/photo/2018/01/05/16/24/rose-3063284_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/gaf4837b390d28a54ef52ffe85003dcbb907f2af11ff8e3aede198e28530172a4d3369b620db7a0ccc9922cd7615fdb5d466141053a4aaab55e2017b505f97921_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL":
        "https://pixabay.com/get/ge88f9c29d8bdec05f3512a9ea671036a6deebf9640405fc4b65f9a431ff1f4c36bc79de373806fce2339312df00a957bcc2409681cef8bf099dd6d4b66d11c50_1280.jpg",
    "imageWidth": 6000,
    "imageHeight": 4000,
    "imageSize": 3574625,
    "views": 1055835,
    "downloads": 681767,
    "collections": 1414,
    "likes": 1534,
    "comments": 329,
    "user_id": 1564471,
    "user": "anncapictures",
    "userImageURL":
        "https://cdn.pixabay.com/user/2015/11/27/06-58-54-609_250x250.jpg"
  }
];
