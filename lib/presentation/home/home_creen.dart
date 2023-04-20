import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_search_app/presentation/home/component/photo_widget.dart';
import 'package:image_search_app/presentation/home/home_ui_event.dart';
import 'package:image_search_app/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  StreamSubscription<HomeUIEvent>? _subscription;

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
    _subscription?.cancel();
  }

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final viewModel = context.read<HomeViewModel>();
      _subscription = viewModel.stream.listen((event) {
        event.when(showSnackBar: (message) {
          final snackBar = SnackBar(content: Text(message));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "이미지 검색 앱",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: _textEditingController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () async {
                      await viewModel.fetch(_textEditingController.text);
                    },
                    icon: const Icon(Icons.search),
                  )),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final photo = viewModel.photos[index];
                return PhotoWidget(photo: photo);
              },
              itemCount: viewModel.photos.length,
            ),
          ),
        ],
      ),
    );
  }
}
