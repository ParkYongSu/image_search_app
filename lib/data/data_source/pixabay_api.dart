import 'package:dio/dio.dart';
import 'package:image_search_app/data/data_source/result.dart';

class PixabayApi {
  static const String baseUrl = "https://pixabay.com/api/";
  static const String key = "35264686-25a202450c7aef5afa18d8c78&q";

  final Dio dio;

  PixabayApi({required this.dio});

  Future<Result<List<dynamic>>> fetch(String query) async {
    try {
      final response = await dio.get(
        "$baseUrl?key=$key&q=$query&image_type=photo&pretty=true",
      );

      final hits = response.data["hits"] as List;

      return Result.success(hits);
    }
    catch (e) {
      return Result.error(e.toString());
    }
  }
}