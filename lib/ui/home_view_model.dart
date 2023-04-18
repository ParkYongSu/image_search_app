import 'dart:async';
import 'package:image_search_app/data/api.dart';
import 'package:image_search_app/model/photo.dart';

class HomeViewModel {
  final PixabayApi api;
  final _photoStreamController = StreamController<List<Photo>>()..add([]);

  HomeViewModel({required this.api});

  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  Future<void> fetch(String query) async {
    final response = await api.fetch(query);
    _photoStreamController.add(response);
  }
}