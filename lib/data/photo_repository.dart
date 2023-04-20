import 'package:image_search_app/model/photo.dart';

abstract class PhotoRepository {
  Future<List<Photo>> fetch(String query);
}