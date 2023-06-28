import 'package:flutter/material.dart';

class CircularAssetImage extends StatelessWidget {
  const CircularAssetImage({
    super.key,
    required this.assetName,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;
  final double radius = 100;
  final String assetName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          border: const Border.fromBorderSide(
            BorderSide(
              color: Colors.white,
            ),
          ),
          image:
              DecorationImage(image: AssetImage(assetName), fit: BoxFit.cover)),
    );
  }
}