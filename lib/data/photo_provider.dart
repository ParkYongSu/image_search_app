import 'package:flutter/material.dart';
import 'package:image_search_app/ui/home_view_model.dart';

class PhotoProvider extends InheritedWidget {
  final HomeViewModel viewModel;

  const PhotoProvider({
    super.key,
    required this.viewModel,
    required super.child,
  });

  static PhotoProvider? maybeOf(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<PhotoProvider>();

    return provider;
  }

  static PhotoProvider of(BuildContext context) {
    final provider = maybeOf(context);

    assert(provider != null, "not found PhotoProvider");

    return provider!;
  }

  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return viewModel.api != oldWidget.viewModel.api;
  }
}
