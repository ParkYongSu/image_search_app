import 'package:flutter_test/flutter_test.dart';
import 'package:image_search_app/data/data_source/result.dart';
import 'package:image_search_app/domain/repository/photo_repository.dart';
import 'package:image_search_app/domain/model/photo.dart';
import 'package:image_search_app/domain/use_case/get_use_case.dart';
import 'package:image_search_app/presentation/home/home_view_model.dart';

void main() {
  test("HomeViewModel test", () async {
    final viewModel = HomeViewModel(useCase: GetUseCase(repository: TestApi()));

    await viewModel.fetch("apple");

    expect(
      viewModel.state.photos,
      testJson.map((e) => Photo.fromJson(e)).toList(),
    );
  });
}

class TestApi implements PhotoRepository {
  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    await Future.delayed(const Duration(seconds: 3));

    return Result.success(testJson.map((e) => Photo.fromJson(e)).toList());
  }
}

List<Map<String, dynamic>> get testJson => [
      {
        "id": 2681039,
        "pageURL":
            "https://pixabay.com/photos/phone-wallpaper-watercolor-painting-2681039/",
        "type": "photo",
        "tags": "phone wallpaper, watercolor, painting",
        "previewURL":
            "https://cdn.pixabay.com/photo/2017/08/25/18/48/watercolor-2681039_150.jpg",
        "previewWidth": 99,
        "previewHeight": 150,
        "webformatURL":
            "https://pixabay.com/get/g4294e9afbf2e8811de22692f01d36829bb92a29d6b16bb14907db22b665c939ca1a0dac346e921298c381c365cd5fd4ea928dfa11c2dc8d41ce8f9cf37fd61d6_640.jpg",
        "webformatWidth": 424,
        "webformatHeight": 640,
        "largeImageURL":
            "https://pixabay.com/get/g070184928be6f74c342546d1db00d7d4bc3e248539e1bd9157bf7a656ee26fadfcf2285fa298c658245febfd4341aee82d4aba07205b4d02976e741ec40c2694_1280.jpg",
        "imageWidth": 3264,
        "imageHeight": 4928,
        "imageSize": 5021313,
        "views": 1254783,
        "downloads": 976006,
        "collections": 1948,
        "likes": 1247,
        "comments": 135,
        "user_id": 4894494,
        "user": "eluela31",
        "userImageURL":
            "https://cdn.pixabay.com/user/2017/04/24/19-55-29-652_250x250.jpg"
      },
    ];
