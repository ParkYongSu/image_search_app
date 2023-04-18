import 'package:dio/dio.dart';
import 'package:image_search_app/model/photo.dart';

class PixabayApi {
  final String _baseUrl = "https://pixabay.com/api/";
  final String _key = "35264686-25a202450c7aef5afa18d8c78&q";

  Future<List<Photo>> fetch(String query) async {
    final dio = Dio();

    final response = await dio.get(
      "$_baseUrl?key=$_key=$query+flowers&image_type=photo&pretty=true",
    );
    final hits = response.data["hits"] as List;

    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}