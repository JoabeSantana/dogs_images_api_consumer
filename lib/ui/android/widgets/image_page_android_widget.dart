import 'package:dogs_images_api_consumer/constantes.dart';
import 'package:flutter/material.dart';

class ImagePageAndroid extends StatelessWidget {
  const ImagePageAndroid({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Constantes.namePageDogDetail)),
      body: SafeArea(
        child: Center(
          child: Image.network(
            imageUrl,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
