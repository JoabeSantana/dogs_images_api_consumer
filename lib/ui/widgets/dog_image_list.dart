import 'dart:ffi';
import 'dart:io';

import 'package:dogs_images_api_consumer/models/dog.dart';
import 'package:dogs_images_api_consumer/ui/android/widgets/image_page_android_widget.dart';
import 'package:dogs_images_api_consumer/ui/ios/widgets/image_page_ios_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DogImageList extends StatelessWidget {
  const DogImageList(
      {super.key, required this.dogs, required this.qtdeImagesGrid});

  final List<Dog> dogs;
  final int qtdeImagesGrid;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: qtdeImagesGrid,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
      itemCount: dogs.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            onTapImage(context, dogs[index]);
          },
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.network(
                dogs[index].imageUrl,
                fit: qtdeImagesGrid == 1 ? BoxFit.contain : BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Container(
                height: 30,
                width: double.infinity,
                color: Colors.black.withOpacity(0.5),
                alignment: Alignment.center,
                child: Text(
                  dogs[index].breeds.first.name,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

onTapImage(BuildContext context, Dog dog) {
  Navigator.of(context).push(
    Platform.isIOS
        ? CupertinoPageRoute(
            builder: (context) => ImagePageIos(dog: dog),
          )
        : MaterialPageRoute(
            builder: (context) => ImagePageAndroid(dog: dog),
          ),
  );
}
