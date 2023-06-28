import 'package:dogs_images_api_consumer/datasources/remote/dog_helper.dart';
import 'package:dogs_images_api_consumer/models/dog.dart';
import 'package:dogs_images_api_consumer/ui/widgets/dog_datails.dart';
import 'package:flutter/cupertino.dart';

class ImagePageIos extends StatelessWidget {
  ImagePageIos({super.key, required this.dog});

  final Dog dog;

  final DogHelper helper = DogHelper();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar:
          CupertinoNavigationBar(middle: Text(dog.breeds.first.name)),
      child: SafeArea(
        child: SingleChildScrollView(
          child: DogDetails(dog: dog, helper: helper),
        ),
      ),
    );
  }
}
