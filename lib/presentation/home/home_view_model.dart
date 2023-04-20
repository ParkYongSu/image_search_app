import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:image_search_app/domain/repository/photo_repository.dart';
import 'package:image_search_app/domain/model/photo.dart';
import 'package:image_search_app/presentation/home/home_ui_event.dart';

class HomeViewModel extends ChangeNotifier {
  final PhotoRepository repository;

  HomeViewModel({required this.repository});

  List<Photo> _photos = [];
  final StreamController<HomeUIEvent> _streamController = StreamController();

  UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);

  Stream<HomeUIEvent> get stream => _streamController.stream;

  Future<void> fetch(String query) async {
    final response = await repository.fetch(query);

    response.when(
      success: (photos) {
        _photos = photos;
        notifyListeners();
      },
      error: (message) {
        _streamController.add(
          HomeUIEvent.showSnackBar("네트워크 오류"),
        );
      },
    );
  }
}
