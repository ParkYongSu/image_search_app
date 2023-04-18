import 'package:flutter/material.dart';
import 'package:image_search_app/data/api.dart';
import 'package:image_search_app/data/photo_provider.dart';
import 'package:image_search_app/ui/home_creen.dart';
import 'package:image_search_app/ui/home_view_model.dart';

void main() {
  runApp(
    MaterialApp(
      home: PhotoProvider(
        viewModel: HomeViewModel(api: PixabayApi()),
        child: HomeScreen(),
      ),
    ),
  );
}
