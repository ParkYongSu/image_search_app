import 'package:flutter/material.dart';
import 'package:image_search_app/di/provider_setup.dart';
import 'package:image_search_app/presentation/home/home_creen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: globalProviders,
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}
