import 'package:flutter/material.dart';

class DetectionAvatar extends StatelessWidget {
  const DetectionAvatar({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: ClipOval(
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
