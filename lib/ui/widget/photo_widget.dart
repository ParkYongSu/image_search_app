import 'package:flutter/material.dart';
import 'package:image_search_app/data/photo_provider.dart';
import 'package:image_search_app/model/photo.dart';

class PhotoWidget extends StatelessWidget {
  final Photo photo;

  const PhotoWidget({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        image: DecorationImage(
          image: NetworkImage(photo.previewURL),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
