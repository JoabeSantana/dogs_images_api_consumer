import 'package:dogs_images_api_consumer/datasources/remote/dog_helper.dart';
import 'package:dogs_images_api_consumer/models/dog.dart';
import 'package:dogs_images_api_consumer/ui/widgets/dog_datails.dart';
import 'package:flutter/material.dart';

class ImagePageAndroid extends StatelessWidget {
  ImagePageAndroid({super.key, required this.dog});

  final Dog dog;

  final DogHelper helper = DogHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(dog.breeds.first.name)),
      body: SafeArea(
        child: Center(
          child: DogDetails(dog: dog, helper: helper),
        ),
      ),
    );
  }
}
