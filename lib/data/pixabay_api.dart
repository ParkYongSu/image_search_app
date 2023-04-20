import 'package:dio/dio.dart';
import 'package:image_search_app/data/photo_repository.dart';
import 'package:image_search_app/model/photo.dart';

class PixabayApi implements PhotoRepository {
  static const String baseUrl = "https://pixabay.com/api/";
  static const String key = "35264686-25a202450c7aef5afa18d8c78&q";

  @override
  Future<List<Photo>> fetch(String query, {Dio? dio}) async {
    dio ??= Dio();

    final response = await dio.get(
      "$baseUrl?key=$key&q=$query&image_type=photo&pretty=true",
    );

    final hits = response.data["hits"] as List;
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}