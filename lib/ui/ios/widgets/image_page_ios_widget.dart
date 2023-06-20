import 'package:dogs_images_api_consumer/constantes.dart';
import 'package:flutter/cupertino.dart';

class ImagePageIos extends StatelessWidget {
  const ImagePageIos({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar:
          const CupertinoNavigationBar(middle: Text(Constantes.namePageDogDetail)),
      child: SafeArea(
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