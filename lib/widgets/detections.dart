import 'package:flutter/material.dart';


class Detections extends StatelessWidget {
  const Detections({super.key, required this.imageUrl1, required this.imageUrl2, required this.text});

  final String imageUrl1;
  final String imageUrl2;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        Image.asset(imageUrl1),
        Image.asset(imageUrl2),
        Text(text, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
