import 'package:image_search_app/data/data_source/result.dart';
import 'package:image_search_app/domain/model/photo.dart';

abstract class PhotoRepository {
  Future<Result<List<Photo>>> fetch(String query);
}