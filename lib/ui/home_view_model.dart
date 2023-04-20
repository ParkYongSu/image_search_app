import 'dart:async';
import 'package:image_search_app/data/photo_repository.dart';
import 'package:image_search_app/model/photo.dart';

class HomeViewModel {
  final PhotoRepository repository;
  final _photoStreamController = StreamController<List<Photo>>()..add([]);

  HomeViewModel({required this.repository});

  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  Future<void> fetch(String query) async {
    final response = await repository.fetch(query);
    _photoStreamController.add(response);
  }
}