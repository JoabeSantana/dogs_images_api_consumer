import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {
  const BoldText(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.color});

  final String text;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}