import 'package:dogs_images_api_consumer/ui/widgets/bold_text.dart';
import 'package:flutter/material.dart';

class ItemDescriptionWithDivider extends StatelessWidget {
  const ItemDescriptionWithDivider(
      {super.key,
      required this.title,
      required this.description,
      this.paddingTop = 0.0,
      this.paddingBottom = 0.0});

  final String title;
  final String description;
  final double paddingTop;
  final double paddingBottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(top: paddingTop)),
        BoldText(
          text: title,
          fontSize: 16,
          color: Colors.white70,
        ),
        const Padding(padding: EdgeInsets.only(top: 10)),
        Text(
          description,
          style: const TextStyle(color: Colors.white60),
        ),
        const Padding(padding: EdgeInsets.only(top: 10)),
        const Divider(color: Colors.white10),
        Padding(padding: EdgeInsets.only(bottom: paddingBottom)),
      ],
    );
  }
}