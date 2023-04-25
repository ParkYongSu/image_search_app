import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_search_app/domain/use_case/get_use_case.dart';
import 'package:image_search_app/presentation/home/home_state.dart';
import 'package:image_search_app/presentation/home/home_ui_event.dart';

class HomeViewModel extends ChangeNotifier {
  final GetUseCase useCase;

  HomeViewModel({required this.useCase});

  HomeState _homeState = HomeState(
    photos: [],
    isLoading: false,
  );

  final StreamController<HomeUIEvent> _streamController = StreamController();

  HomeState get state => _homeState;

  Stream<HomeUIEvent> get stream => _streamController.stream;

  Future<void> fetch(String query) async {
    _homeState = _homeState.copyWith(isLoading: true);
    notifyListeners();

    final response = await useCase.call(query);

    response.when(
      success: (photos) {
        _homeState = _homeState.copyWith(photos: photos);
        notifyListeners();
      },
      error: (message) {
        _streamController.add(
          HomeUIEvent.showSnackBar("네트워크 오류"),
        );
      },
    );

    _homeState = _homeState.copyWith(isLoading: false);
    notifyListeners();
  }
}
