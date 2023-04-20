import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:image_search_app/data/photo_repository.dart';
import 'package:image_search_app/model/photo.dart';

class HomeViewModel extends ChangeNotifier {
  final PhotoRepository repository;
  List<Photo> _photos = [];

  HomeViewModel({required this.repository});

  UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);

  Future<void> fetch(String query) async {
    final response = await repository.fetch(query);
    _photos = response;
    notifyListeners();
  }
}