import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_search_app/data/data_source/pixabay_api.dart';
import 'package:image_search_app/data/repository/photo_reposioty_impl.dart';
import 'package:image_search_app/presentation/home/home_creen.dart';
import 'package:image_search_app/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
      home: ChangeNotifierProvider(
        create: (_) => HomeViewModel(
          repository: PhotoRepositoryImpl(
            api: PixabayApi(
              dio: Dio(),
            ),
          ),
        ),
        child: HomeScreen(),
      ),
    ),
  );
}
