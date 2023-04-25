import 'dart:math';

import 'package:image_search_app/data/data_source/result.dart';
import 'package:image_search_app/domain/model/photo.dart';
import 'package:image_search_app/domain/repository/photo_repository.dart';

class GetUseCase {
  final PhotoRepository repository;

  const GetUseCase({required this.repository});

  Future<Result<List<Photo>>> call(String query) async {
    final response = await repository.fetch(query);

    return response.when(
      success: (photos) {
        return Result.success(photos.sublist(0, min(3, photos.length)));
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }
}