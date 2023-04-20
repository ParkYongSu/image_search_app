import 'package:image_search_app/data/data_source/pixabay_api.dart';
import 'package:image_search_app/data/data_source/result.dart';
import 'package:image_search_app/domain/repository/photo_repository.dart';
import 'package:image_search_app/domain/model/photo.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PixabayApi api;

  PhotoRepositoryImpl({required this.api});

  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    final response = await api.fetch(query);

    return response.when(
      success: (result) {
        return Result.success(
          result.map((e) => Photo.fromJson(e)).toList(),
        );
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }
}
