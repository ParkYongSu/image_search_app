import 'package:flutter/material.dart';
import 'package:image_search_app/data/pixabay_api.dart';
import 'package:image_search_app/ui/home_creen.dart';
import 'package:image_search_app/ui/home_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
      home: ChangeNotifierProvider(
        create: (_) => HomeViewModel(repository: PixabayApi()),
        child: HomeScreen(),
      ),
    ),
  );
}
