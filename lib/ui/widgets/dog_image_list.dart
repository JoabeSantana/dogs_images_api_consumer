import 'dart:io';

import 'package:dogs_images_api_consumer/models/dog.dart';
import 'package:dogs_images_api_consumer/ui/android/widgets/image_page_android_widget.dart';
import 'package:dogs_images_api_consumer/ui/ios/widgets/image_page_ios_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DogImageList extends StatelessWidget {
  const DogImageList({super.key, required this.images, required this.qtdeImagesGrid});

  final List<Dog> images;
  final int qtdeImagesGrid;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: qtdeImagesGrid,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            onTapImage(context, images[index].image);
          },
          child: Image.network(
            images[index].image,
            fit: qtdeImagesGrid == 1 ? BoxFit.contain : BoxFit.cover,
          ),
        );
      },
    );
  }
}

onTapImage(BuildContext context, String url) {
  Navigator.of(context).push(
    Platform.isIOS
        ? CupertinoPageRoute(
            builder: (context) => ImagePageIos(imageUrl: url),
          )
        : MaterialPageRoute(
            builder: (context) => ImagePageAndroid(imageUrl: url),
          ),
  );
}
